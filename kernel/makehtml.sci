function makehtml(htmlfile, datamatrix)
fh = mopen(htmlfile,'wt');
mfprintf(fh,'    <html>\n');
mfprintf(fh,'      <head>\n');
mfprintf(fh,'        <script type='"text/javascript'" src='"https://www.google.com/jsapi'"></script>\n');
mfprintf(fh,'        <script type='"text/javascript'">\n');
mfprintf(fh,'          google.load('"visualization'", '"1'", {packages:['"corechart'"]});\n');
mfprintf(fh,'          google.setOnLoadCallback(drawChart);\n');
mfprintf(fh,'          function drawChart() {\n');
mfprintf(fh,'            var data = google.visualization.arrayToDataTable([\n');
mfprintf(fh,'              ["'Feature 1"', "'Feature 2"'],\n');
mfprintf(fh,'              ');
for i = 1 : size(datamatrix,2)
  mfprintf(fh,'[%1.5f, %1.5f]',datamatrix(1,i),datamatrix(2,i));
  if (i ~= size(datamatrix,2))
    mfprintf(fh,', ');
  end
end
mfprintf(fh,'\n');
mfprintf(fh,'            ]);\n');
mfprintf(fh,'    \n');
mfprintf(fh,'            var options = {\n');
mfprintf(fh,'              title: "'User Features"',\n');
mfprintf(fh,'              hAxis: {title: "'Feature 1"', minValue: -2.9, maxValue: 2.9},\n');
mfprintf(fh,'              vAxis: {title: "'Feature 2"', minValue: -2.9, maxValue: 2.9},\n');
mfprintf(fh,'              legend: "'none"'\n');
mfprintf(fh,'            };\n');
mfprintf(fh,'    \n');
mfprintf(fh,'            var chart = new google.visualization.ScatterChart(document.getElementById("'chart_div"'));\n');
mfprintf(fh,'            chart.draw(data, options);\n');
mfprintf(fh,'          }\n');
mfprintf(fh,'        </script>\n');
mfprintf(fh,'      </head>\n');
mfprintf(fh,'      <body>\n');
mfprintf(fh,'        <div id='"chart_div'" style='"width: 900px; height: 500px;'"></div>\n');
mfprintf(fh,'      </body>\n');
mfprintf(fh,'    </html>\n');
mclose(fh);
endfunction

