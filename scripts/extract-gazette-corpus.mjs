#!/usr/bin/env node
/**
 * Extract gazette corpora from data/countries/*.sexp for lunar/variable holidays.
 * Usage: node scripts/extract-gazette-corpus.mjs
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, '..');
const countriesDir = path.join(root, 'data', 'countries');

function readSexpDays(file) {
  const text = fs.readFileSync(file, 'utf8');
  const days = [];
  for (const m of text.matchAll(/\((\d{4}) (\d{1,2}) (\d{1,2}) "([^"]*)"/g)) {
    days.push({ y: +m[1], m: +m[2], d: +m[3], name: m[4] });
  }
  return days;
}

function byYearBlocks(days, matchFn, labelFn) {
  const map = new Map();
  for (const row of days) {
    if (!matchFn(row)) continue;
    const y = row.y;
    if (!map.has(y)) map.set(y, []);
    map.get(y).push([[row.y, row.m, row.d], labelFn(row)]);
  }
  return [...map.entries()].sort((a, b) => b[0] - a[0]);
}

function writeGazette(outPath, header, blocks, authority, uri) {
  const lines = [header, '(', ...blocks.flatMap(([year, holidays]) => [
    ` (:year ${year}`,
    `  :authority ${JSON.stringify(authority.replace('{Y}', String(year)))}`,
    `  :uri ${JSON.stringify(uri)}`,
    '  :holidays (',
    ...holidays.map(([ymd, name]) => `              ((${ymd[0]} ${ymd[1]} ${ymd[2]}) ${JSON.stringify(name)})`),
    '              ))',
    '',
  ]), ')'];
  fs.mkdirSync(path.dirname(outPath), { recursive: true });
  fs.writeFileSync(outPath, lines.join('\n') + '\n');
}

// LK — Poya + Vesak day-after + Deepavali (Sinhala names)
const lkDays = readSexpDays(path.join(countriesDir, 'LK.sexp'));
const lkBlocks = byYearBlocks(
  lkDays,
  (r) => r.name.includes('පෝය') || r.name.includes('වෙසක් පෝය') || r.name.includes('දීපවාලි'),
  (r) => {
    if (r.name.includes('දීපවාලි')) return 'Deepavali';
    if (r.name.includes('වෙසක් පෝය දිනට පසු')) return 'Day after Vesak Poya';
    if (r.name.includes('වෙසක්')) return 'Vesak Poya';
    return 'Poya Day';
  },
);
writeGazette(
  path.join(root, 'data', 'lk', 'poya-days.sexp'),
  ';;;; Sri Lanka gazetted Poya / Vesak / Deepavali (from MOE circulars; corpus 2000–2040).',
  lkBlocks.filter(([y]) => y >= 2000 && y <= 2040),
  'Gazetted public holiday — {Y}',
  'https://www.documents.gov.lk/',
);

// SG — Vesak, Deepavali, Hari Raya (corpus names)
const sgDays = readSexpDays(path.join(countriesDir, 'SG.sexp'));
const sgBlocks = byYearBlocks(
  sgDays,
  (r) => /Vesak|Deepavali|Hari Raya/i.test(r.name),
  (r) => r.name.replace(/\s+/g, ' ').trim(),
);
writeGazette(
  path.join(root, 'data', 'sg', 'gazette-holidays.sexp'),
  ';;;; Singapore MOM gazetted holidays (Vesak, Deepavali, Hari Raya). Corpus 2000–2040.',
  sgBlocks.filter(([y]) => y >= 2000 && y <= 2040),
  'MOM gazetted public holiday — {Y}',
  'https://www.mom.gov.sg/employment-practices/public-holidays',
);

console.log('Wrote LK and SG gazette corpora');
