import { mkdirSync, readdirSync, statSync } from 'node:fs';
import { basename, join, dirname, relative, parse, format } from 'node:path';
import { exec } from 'node:child_process';
import { promisify } from 'node:util';
import { SingleBar, Presets } from 'cli-progress';

const execAsync = promisify(exec);

const BASE_PATH = './src';
const ENTRY_POINT_FILENAME = 'main.typ'

function findEntryPoints(fp: string): string[] {
  if (statSync(fp).isFile()) {
    return basename(fp) === ENTRY_POINT_FILENAME ? [fp] : [];
  }
  return readdirSync(fp, { withFileTypes: true }).flatMap((dirent) => findEntryPoints(join(fp, dirent.name)))
  
}

const entryPoints = findEntryPoints(BASE_PATH);



await execAsync(`rm -rf dist && mkdir dist`);


const progressBar = new SingleBar({
  format: 'Compiling |{bar}| {percentage}% | {value}/{total} files | {filename}',
  barCompleteChar: '\u2588',
  barIncompleteChar: '\u2591',
  hideCursor: true
}, Presets.shades_grey);

progressBar.start(entryPoints.length, 0, { filename: 'Starting...' });
const done: number[] = [];

await Promise.all(
  entryPoints.map(async (entryPoint, idx) => {
    const relativePath = relative(BASE_PATH, entryPoint);
    const parsed = parse(relativePath);
    const outputPath = format({
      dir: join('dist', dirname(parsed.dir)),
      name: basename(parsed.dir),
      ext: '.pdf'
    });
    
    mkdirSync(dirname(outputPath), { recursive: true });
    await execAsync(`bunx typst compile "${entryPoint}" "${outputPath}"`);

    done.push(idx);
    progressBar.update(done.length, { filename: basename(outputPath) });
  })
);

progressBar.stop();

