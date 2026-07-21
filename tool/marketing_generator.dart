// ignore_for_file: avoid_print
import 'dart:io';
import 'package:gnps_learning_hub/data/journey_data.dart';

/// Generates a modern 1-page marketing PDF of the curriculum.
///
/// To run this tool, use:
/// ```bash
/// flutter test tool/marketing_generator.dart
/// ```
///
/// KEY FIX vs the original: LibreOffice's HTML→PDF converter has very
/// weak support for Flexbox, CSS Grid, and gradients — that's why the
/// layout was breaking. This version prints the PDF with headless
/// Chromium instead, which renders modern CSS the same way a browser
/// would.
///
/// Requires Chromium or Google Chrome installed on the machine that
/// runs this script. Set CHROMIUM_PATH below if it's not on your PATH.
void main() async {
  print('🚀 Starting Modern Curriculum Generator...');
  await generateMarketingPdf();
}

const String chromiumPath = String.fromEnvironment(
  'CHROMIUM_PATH',
  defaultValue:
      'chromium', // try 'google-chrome', 'chromium-browser', or a full path if this fails
);

Future<void> generateMarketingPdf() async {
  final buffer = StringBuffer();

  int appTotalTasks = 0;
  for (final lesson in journeyData.lessons) {
    appTotalTasks += lesson.allTasks.length;
  }

  const style = '''
<style>
  @import url('https://fonts.googleapis.com/css2?family=Baloo+2:wght@500;700;800&family=Manrope:wght@400;600;700;800&display=swap');

  @page { size: A4; margin: 0; }

  :root{
    --ink:#0E2438;
    --indigo:#0B3D66;
    --indigo-deep:#062339;
    --amber:#FFB020;
    --amber-deep:#E8930A;
    --teal:#2A9D8F;
    --cream:#FFF9EF;
    --paper:#FFFFFF;
    --line:#E4DCC9;
  }

  *{ box-sizing:border-box; }

  body{
    font-family:'Manrope', sans-serif;
    color:var(--ink);
    margin:0;
    background:var(--cream);
    -webkit-font-smoothing:antialiased;
  }

  .page{
    width:210mm;
    height:297mm;
    position:relative;
    overflow:hidden;
    display:flex;
    flex-direction:column;
  }

  .hero{
    background:
      radial-gradient(circle at 88% -10%, rgba(255,176,32,0.35), transparent 45%),
      linear-gradient(135deg, var(--indigo) 0%, var(--indigo-deep) 100%);
    color:#fff;
    padding:12mm 16mm 11mm 16mm;
    position:relative;
  }

  .path-track{
    position:absolute;
    top:0; right:0; bottom:0; left:0;
    opacity:0.14;
    background-image: radial-gradient(circle, #fff 2.2px, transparent 2.2px);
    background-size:16px 16px;
    background-position: -4px -4px;
    mask-image: linear-gradient(to bottom, black, transparent 85%);
  }

  .eyebrow{
    display:inline-flex;
    align-items:center;
    gap:7px;
    background:rgba(255,255,255,0.12);
    border:1px solid rgba(255,255,255,0.28);
    padding:5px 13px;
    border-radius:999px;
    font-size:10.5px;
    font-weight:700;
    letter-spacing:0.14em;
    text-transform:uppercase;
    position:relative;
    z-index:1;
  }
  .eyebrow .dot{ width:6px; height:6px; border-radius:50%; background:var(--amber); }

  .hero-top{
    display:flex;
    align-items:flex-end;
    justify-content:space-between;
    gap:14mm;
    margin-top:10px;
    position:relative;
    z-index:1;
  }

  .hero h1{
    font-family:'Baloo 2', sans-serif;
    font-weight:800;
    font-size:34px;
    line-height:1.06;
    margin:0;
    letter-spacing:-0.5px;
    flex:0 0 auto;
    max-width:95mm;
  }
  .hero h1 span{ color:var(--amber); }

  .hero p.sub{
    font-size:12.5px;
    color:rgba(255,255,255,0.82);
    margin:0 0 3px 0;
    line-height:1.6;
    font-weight:500;
    flex:1 1 auto;
    max-width:86mm;
    text-align:left;
    border-left:2px solid rgba(255,176,32,0.5);
    padding-left:10px;
  }

  .stat-row{
    display:flex;
    gap:10mm;
    margin-top:9mm;
    position:relative;
    z-index:1;
  }
  .stat{
    flex:1;
    display:flex;
    align-items:baseline;
    gap:9px;
    border-left:2px solid rgba(255,176,32,0.55);
    padding-left:10px;
  }
  .stat b{
    font-family:'Baloo 2', sans-serif;
    font-size:30px;
    font-weight:800;
    color:var(--amber);
    line-height:1;
  }
  .stat span{
    font-size:10.5px;
    font-weight:700;
    text-transform:uppercase;
    letter-spacing:0.08em;
    color:rgba(255,255,255,0.72);
  }

  .body-wrap{
    flex:1;
    padding:11mm 16mm 8mm 16mm;
    display:flex;
    flex-direction:column;
  }

  .section-label{
    display:flex;
    align-items:center;
    gap:10px;
    margin:0 0 7mm 0;
  }
  .section-label .rule{ flex:1; height:1px; background:var(--line); }
  .section-label h2{
    font-family:'Baloo 2', sans-serif;
    font-size:15px;
    font-weight:700;
    color:var(--indigo);
    text-transform:uppercase;
    letter-spacing:0.08em;
    margin:0;
    white-space:nowrap;
  }

  .journey{
    position:relative;
    display:grid;
    grid-template-columns:repeat(2, 1fr);
    gap:6mm 9mm;
  }

  .stop{
    background:var(--paper);
    border:1px solid var(--line);
    border-radius:12px;
    padding:9px 11px 10px 11px;
    position:relative;
    box-shadow:0 3px 0 rgba(11,61,102,0.05);
  }

  .stop .num{
    position:absolute;
    top:-9px;
    left:11px;
    background:var(--teal);
    color:#fff;
    font-size:10px;
    font-weight:800;
    width:19px;
    height:19px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    box-shadow:0 2px 4px rgba(0,0,0,0.18);
  }

  .stop h3{
    font-family:'Baloo 2', sans-serif;
    font-size:12.5px;
    font-weight:700;
    color:var(--indigo);
    margin:5px 0 5px 0;
    line-height:1.2;
  }

  .stop .count{
    font-size:9.5px;
    font-weight:700;
    color:var(--amber-deep);
    background:#FFF3DC;
    border-radius:6px;
    padding:1.5px 6px;
    display:inline-block;
    margin-bottom:5px;
  }

  .stop .pills{
    display:flex;
    flex-wrap:wrap;
    gap:4px;
  }
  .stop .pill{
    display:inline-flex;
    align-items:baseline;
    gap:4px;
    background:#F0F6F5;
    border:1px solid #DCEBE8;
    border-radius:999px;
    padding:2.5px 8px;
    font-size:8.5px;
    font-weight:600;
    color:#33505E;
    line-height:1.3;
  }
  .stop .pill b{
    font-size:8.5px;
    font-weight:800;
    color:var(--teal);
  }

  .arcade{
    margin-top:8mm;
    background:linear-gradient(120deg, #0B3D66, #123F63 60%, #0B3D66);
    border-radius:14px;
    padding:9mm 11mm;
    color:#fff;
    display:flex;
    align-items:center;
    gap:9mm;
  }
  .arcade .icon{
    width:46px; height:46px;
    border-radius:12px;
    background:var(--amber);
    display:flex; align-items:center; justify-content:center;
    font-size:22px;
    flex:none;
  }
  .arcade .text{ flex:none; width:44mm; }
  .arcade .text h3{
    font-family:'Baloo 2', sans-serif;
    font-size:14px;
    margin:0 0 3px 0;
  }
  .arcade .text p{
    font-size:9.5px;
    margin:0;
    color:rgba(255,255,255,0.72);
    line-height:1.4;
  }
  .tags{
    display:flex;
    flex-wrap:wrap;
    gap:6px;
    flex:1;
  }
  .tag{
    background:rgba(255,255,255,0.1);
    border:1px solid rgba(255,255,255,0.24);
    padding:4px 10px;
    border-radius:999px;
    font-size:9.5px;
    font-weight:600;
  }

  .footer{
    margin-top:auto;
    padding-top:6mm;
    display:flex;
    justify-content:space-between;
    align-items:center;
    font-size:8.5px;
    color:#9BA9B6;
    border-top:1px solid var(--line);
  }
  .footer .brand{ font-weight:700; color:var(--indigo); }
</style>
''';

  buffer.writeln(
    '<!DOCTYPE html><html><head><meta charset="UTF-8">$style</head><body>',
  );
  buffer.writeln('<div class="page">');

  // Hero
  buffer.writeln('<div class="hero">');
  buffer.writeln('  <div class="path-track"></div>');
  buffer.writeln(
    '  <span class="eyebrow"><span class="dot"></span>GNPS Learning Hub</span>',
  );
  buffer.writeln('  <div class="hero-top">');
  buffer.writeln(
    '    <h1>Punjabi, learned<br>the <span>joyful</span> way</h1>',
  );
  buffer.writeln(
    '    <p class="sub">A complete guided curriculum that takes young learners from first letters to fluent little readers — one playful lesson at a time.</p>',
  );
  buffer.writeln('  </div>');
  buffer.writeln('  <div class="stat-row">');
  buffer.writeln(
    '    <div class="stat"><b>${journeyData.lessons.length}</b><span>Lessons</span></div>',
  );
  buffer.writeln(
    '    <div class="stat"><b>$appTotalTasks</b><span>Activities</span></div>',
  );
  buffer.writeln(
    '    <div class="stat"><b>${journeyData.games.length}</b><span>Arcade Games</span></div>',
  );
  buffer.writeln('  </div>');
  buffer.writeln('</div>');

  buffer.writeln('<div class="body-wrap">');
  buffer.writeln(
    '  <div class="section-label"><h2>The Learning Journey</h2><div class="rule"></div></div>',
  );
  buffer.writeln('  <div class="journey">');

  for (var i = 0; i < journeyData.lessons.length; i++) {
    final lesson = journeyData.lessons[i];
    buffer.writeln('    <div class="stop">');
    buffer.writeln('      <span class="num">${i + 1}</span>');
    buffer.writeln('      <h3>${lesson.title}</h3>');
    buffer.writeln(
      '      <span class="count">${lesson.allTasks.length} activities</span>',
    );
    buffer.writeln('      <div class="pills">');
    for (final section in lesson.sections) {
      // NOTE: assumes `section.tasks` exists (mirrors lesson.allTasks).
      // If your Section model names this differently, swap it in below.
      buffer.writeln(
        '        <span class="pill">${section.title} <b>${section.tasks.length}</b></span>',
      );
    }
    buffer.writeln('      </div>');
    buffer.writeln('    </div>');
  }

  buffer.writeln('  </div>'); // end journey grid

  // Arcade
  buffer.writeln('  <div class="arcade">');
  buffer.writeln('    <div class="icon">🕹️</div>');
  buffer.writeln(
    '    <div class="text"><h3>Learning Arcade</h3><p>Every lesson unlocks new games that turn review into play.</p></div>',
  );
  buffer.writeln('    <div class="tags">');
  for (final game in journeyData.games) {
    buffer.writeln('      <span class="tag">${game.title}</span>');
  }
  buffer.writeln('    </div>');
  buffer.writeln('  </div>');

  buffer.writeln('  <div class="footer">');
  buffer.writeln(
    '    <span><span class="brand">GNPS Learning Hub</span> · Curriculum Overview</span>',
  );
  buffer.writeln(
    '    <span>Generated ${DateTime.now().year} · v${journeyData.version}</span>',
  );
  buffer.writeln('  </div>');

  buffer.writeln('</div>'); // end body-wrap
  buffer.writeln('</div>'); // end page
  buffer.writeln('</body></html>');

  final htmlFile = File('curriculum_modern_temp.html');
  await htmlFile.writeAsString(buffer.toString());

  final outFile = File('GNPS_Modern_Curriculum.pdf').absolute.path;
  final htmlUri = Uri.file(htmlFile.absolute.path).toString();

  final result = await Process.run(chromiumPath, [
    '--headless',
    '--disable-gpu',
    '--no-sandbox',
    '--print-to-pdf=$outFile',
    '--print-to-pdf-no-header',
    '--no-margins',
    '--virtual-time-budget=5000', // give web fonts/gradients time to load
    htmlUri,
  ]);

  if (result.exitCode == 0 && await File(outFile).exists()) {
    print('✅ Modern 1-Page PDF generated: GNPS_Modern_Curriculum.pdf');
  } else {
    print(
      '❌ Chromium conversion failed (exit ${result.exitCode}): ${result.stderr}',
    );
    print('   If "chromium" isn\'t on PATH, run with:');
    print(
      '   dart run --define=CHROMIUM_PATH=/path/to/chrome tool/marketing_generator.dart',
    );
  }

  if (await htmlFile.exists()) await htmlFile.delete();
}
