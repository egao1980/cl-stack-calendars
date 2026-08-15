#!/usr/bin/env node
/**
 * Regenerate data/countries/*.sexp from commenthol/date-holidays (CC BY-SA 3.0).
 * Usage: node scripts/generate-country-holidays.mjs
 */
import { createRequire } from 'module';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const require = createRequire(import.meta.url);
const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, '..');
const outDir = path.join(root, 'data', 'countries');

// Prefer local node_modules next to this script's temp install, else try require from cwd.
let Holidays;
try {
  Holidays = require('date-holidays');
} catch {
  console.error('Install date-holidays first: npm install date-holidays');
  process.exit(1);
}

const YEAR_FROM = 2000;
const YEAR_TO = 2040;
const TYPES = new Set(['public', 'bank']);

function sexpString(s) {
  return '"' + String(s).replace(/\\/g, '\\\\').replace(/"/g, '\\"') + '"';
}

fs.mkdirSync(outDir, { recursive: true });
const hdMeta = new Holidays();
const countries = hdMeta.getCountries('en');
const codes = Object.keys(countries).sort();
const index = [];
let totalDays = 0;

for (const code of codes) {
  const hd = new Holidays(code);
  const days = [];
  for (let y = YEAR_FROM; y <= YEAR_TO; y++) {
    for (const h of hd.getHolidays(y) || []) {
      if (!TYPES.has(h.type)) continue;
      const [yy, mm, dd] = h.date.slice(0, 10).split('-').map(Number);
      const name = (h.name || h.rule || 'holiday').replace(/\s+/g, ' ').trim();
      days.push([yy, mm, dd, name, h.type]);
    }
  }
  totalDays += days.length;
  index.push([code, countries[code], days.length]);
  const lines = [
    ';; Generated from commenthol/date-holidays (CC BY-SA 3.0)',
    `;; country=${code} years=${YEAR_FROM}-${YEAR_TO} types=public,bank`,
    '(',
    ` :code ${sexpString(code)}`,
    ` :name ${sexpString(countries[code])}`,
    ` :source "https://github.com/commenthol/date-holidays"`,
    ` :license "CC-BY-SA-3.0"`,
    ` :years (${YEAR_FROM} . ${YEAR_TO})`,
    ' :days (',
    ...days.map(([y, m, d, n, t]) => `  (${y} ${m} ${d} ${sexpString(n)} :${t})`),
    ' ))',
  ];
  fs.writeFileSync(path.join(outDir, `${code}.sexp`), lines.join('\n') + '\n');
}

const extras = [
  ['PS', 'Palestine', 'ISO 3166-1; not in date-holidays — extend from local decree'],
  ['NCY', 'Northern Cyprus', 'Unrecognized; extend from local calendar'],
  ['PMR', 'Transnistria', 'Unrecognized; extend from local calendar'],
  ['ABH', 'Abkhazia', 'Limited recognition — extend from local calendar'],
  ['OST', 'South Ossetia', 'Limited recognition — extend from local calendar'],
  ['SOL', 'Somaliland', 'Unrecognized — extend from local calendar'],
];

for (const [code, name, note] of extras) {
  if (codes.includes(code)) continue;
  index.push([code, name, 0]);
  fs.writeFileSync(
    path.join(outDir, `${code}.sexp`),
    [
      ';; Stub — add :days from local statute/decree.',
      '(',
      ` :code ${sexpString(code)}`,
      ` :name ${sexpString(name)}`,
      ` :source "stub"`,
      ` :note ${sexpString(note)}`,
      ' :days ()',
      ')',
    ].join('\n') + '\n',
  );
}

fs.writeFileSync(
  path.join(outDir, 'index.sexp'),
  [';; Country holiday index (date-holidays + stubs)', '(',
   ...index.map(([c, n, k]) => ` (${sexpString(c)} ${sexpString(n)} ${k})`),
   ')'].join('\n') + '\n',
);

console.log(`Wrote ${index.length} countries, ${totalDays} day entries → ${outDir}`);
