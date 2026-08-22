#!/usr/bin/env node
/**
 * Backfill decree/gazette corpora from country corpus where extras are named.
 * Merges 2010–2023 blocks into existing transfer files (keeps 2024–2026 primary).
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, '..');

function readDays(file) {
  if (!fs.existsSync(file)) return [];
  const text = fs.readFileSync(file, 'utf8');
  const days = [];
  for (const m of text.matchAll(/\((\d{4}) (\d{1,2}) (\d{1,2}) "([^"]*)"/g)) {
    days.push({ y: +m[1], m: +m[2], d: +m[3], name: m[4] });
  }
  return days;
}

function yearBlocks(days, { fromYear = 2010, toYear = 2023, match, label }) {
  const byYear = new Map();
  for (const d of days) {
    if (d.y < fromYear || d.y > toYear) continue;
    if (!match(d)) continue;
    if (!byYear.has(d.y)) byYear.set(d.y, []);
    byYear.get(d.y).push([[d.y, d.m, d.d], label ? label(d) : d.name]);
  }
  return [...byYear.entries()].sort((a, b) => b[0] - a[0]);
}

function formatBlock(year, holidays, authority, uri) {
  return ` (:year ${year}
  :authority ${JSON.stringify(authority.replace('{Y}', String(year)))}
  :uri ${JSON.stringify(uri)}
  :holidays (
${holidays.map(([ymd, name]) => `              ((${ymd[0]} ${ymd[1]} ${ymd[2]}) ${JSON.stringify(name)})`).join('\n')}
              ))`;
}

function mergeBackfill(outPath, entries, authority, uri, headerComment) {
  const existing = fs.readFileSync(outPath, 'utf8');
  const recentRe = /\(:year (202[4-6])[\s\S]*?\)\)/g;
  const recent = [];
  let m;
  while ((m = recentRe.exec(existing)) !== null) {
    recent.push(m[0]);
  }
  const backfill = entries.map(([year, holidays]) => formatBlock(year, holidays, authority, uri));
  const body = [...recent, ...backfill].join('\n\n');
  const content = `${headerComment}\n(\n${body}\n)\n`;
  fs.writeFileSync(outPath, content);
  return backfill.length;
}

// CL — Feriado Adicional Fiestas Patrias + Día adicional (corpus-named extras)
const clDays = readDays(path.join(root, 'data', 'countries', 'CL.sexp'));
const clBlocks = yearBlocks(clDays, {
  match: (d) => /Feriado Adicional|Día adicional/i.test(d.name),
});
const clN = mergeBackfill(
  path.join(root, 'data', 'cl', 'transfers.sexp'),
  clBlocks,
  'D.O. — feriado adicional Fiestas Patrias {Y} (corpus backfill)',
  'https://www.diariooficial.interior.gob.cl/',
  ';;;; Diario Oficial — feriados adicionales / puentes (Fiestas Patrias etc.).\n;;;; Coverage: 2010–2026 (2024–2026 primary; 2010–2023 corpus backfill).',
);
console.log(`CL transfers: ${clN} year blocks (2010–2023)`);

// PH/TH/MY/CO — corpus lacks bridge/proclamation extras; keep 2024–2026 only.
console.log('PH/TH/MY/CO: no corpus bridge pattern — 2024–2026 primary blocks unchanged');

// IN DoPT — curated Annexure-I Hindu/Buddhist/Sikh set (DoPT OMs 2010–2019)
const inDopt = [
  [2019, [[3, 21, 'Holi'], [5, 18, 'Buddha Purnima'], [8, 24, 'Janmashtami'], [10, 8, 'Dussehra'], [10, 27, 'Diwali'], [11, 12, 'Guru Nanak Jayanti']]],
  [2018, [[3, 2, 'Holi'], [4, 30, 'Buddha Purnima'], [9, 3, 'Janmashtami'], [10, 19, 'Dussehra'], [11, 7, 'Diwali'], [11, 23, 'Guru Nanak Jayanti']]],
  [2017, [[3, 13, 'Holi'], [5, 10, 'Buddha Purnima'], [8, 15, 'Janmashtami'], [9, 30, 'Dussehra'], [10, 19, 'Diwali'], [11, 4, 'Guru Nanak Jayanti']]],
  [2016, [[3, 24, 'Holi'], [5, 21, 'Buddha Purnima'], [8, 25, 'Janmashtami'], [10, 11, 'Dussehra'], [10, 30, 'Diwali'], [11, 14, 'Guru Nanak Jayanti']]],
  [2015, [[3, 6, 'Holi'], [5, 4, 'Buddha Purnima'], [9, 5, 'Janmashtami'], [10, 22, 'Dussehra'], [11, 11, 'Diwali'], [11, 25, 'Guru Nanak Jayanti']]],
  [2014, [[3, 17, 'Holi'], [5, 14, 'Buddha Purnima'], [8, 18, 'Janmashtami'], [10, 3, 'Dussehra'], [10, 23, 'Diwali'], [11, 6, 'Guru Nanak Jayanti']]],
  [2013, [[3, 27, 'Holi'], [5, 25, 'Buddha Purnima'], [8, 28, 'Janmashtami'], [10, 13, 'Dussehra'], [11, 3, 'Diwali'], [11, 17, 'Guru Nanak Jayanti']]],
  [2012, [[3, 8, 'Holi'], [5, 6, 'Buddha Purnima'], [8, 10, 'Janmashtami'], [10, 24, 'Dussehra'], [11, 13, 'Diwali'], [11, 28, 'Guru Nanak Jayanti']]],
  [2011, [[3, 20, 'Holi'], [5, 17, 'Buddha Purnima'], [8, 22, 'Janmashtami'], [10, 6, 'Dussehra'], [10, 26, 'Diwali'], [11, 10, 'Guru Nanak Jayanti']]],
  [2010, [[3, 1, 'Holi'], [5, 27, 'Buddha Purnima'], [9, 2, 'Janmashtami'], [10, 17, 'Dussehra'], [11, 5, 'Diwali'], [11, 21, 'Guru Nanak Jayanti']]],
];

const inPath = path.join(root, 'data', 'in', 'dopt-holidays.sexp');
const inExisting = fs.readFileSync(inPath, 'utf8');
const inRecent = [];
const inRe = /\(:year (202[0-6])[\s\S]*?\)\)/g;
let inM;
while ((inM = inRe.exec(inExisting)) !== null) {
  inRecent.push(inM[0]);
}
const inBackfill = inDopt.map(([year, rows]) => formatBlock(
  year,
  rows.map(([mo, da, name]) => [[year, mo, da], name]),
  'DoPT OM — holidays for Central Government offices {Y}',
  'https://dopt.gov.in/',
));
const inContent = `;;;; DoPT Office Memorandum — gazetted compulsory holidays (Hindu/Buddhist/Sikh).
;;;; Attach via (india-holidays-calendar :year N). Islamic set remains computed.
;;;; Coverage: 2010–2026 (DoPT OMs / holiday lists).

(
${[...inRecent, ...inBackfill].join('\n\n')}
)
`;
fs.writeFileSync(inPath, inContent);
console.log(`IN DoPT: added ${inBackfill.length} year blocks (2010–2019)`);
