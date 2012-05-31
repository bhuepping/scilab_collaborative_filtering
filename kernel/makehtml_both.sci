function makehtml_both(usermatrix, itemmatrix)
fh = mopen('user_item_features.html','wt');

mfprintf(fh,'<!DOCTYPE html PUBLIC '"-//W3C//DTD XHTML 1.0 Strict//EN'" '"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'">\n');
mfprintf(fh,'<html xmlns='"http://www.w3.org/1999/xhtml'">\n');
mfprintf(fh,'  <head>\n');
mfprintf(fh,'    <meta http-equiv='"content-type'" content='"text/html; charset=utf-8'"/>\n');
mfprintf(fh,'    <title>\n');
mfprintf(fh,'      Google Visualization API Sample\n');
mfprintf(fh,'    </title>\n');
mfprintf(fh,'    <script type='"text/javascript'" src='"http://www.google.com/jsapi'"></script>\n');
mfprintf(fh,'    <script type='"text/javascript'">\n');
mfprintf(fh,'      google.load("'visualization"', "'1"', {packages: ["'corechart"']});\n');
mfprintf(fh,'    </script>\n');
mfprintf(fh,'    <script type='"text/javascript'">\n');
mfprintf(fh,'      function drawVisualization() {');
mfprintf(fh,'        // Create and populate the data table.\n');
mfprintf(fh,'              var data = new google.visualization.DataTable();\n');
mfprintf(fh,'      data.addColumn("'number"', "'X"');\n');
mfprintf(fh,'      data.addColumn("'number"',"'User"');\n');
mfprintf(fh,'      data.addColumn("'number"',"'Items"');\n');

for i = 1 : size(usermatrix,2)
  mfprintf(fh,'      data.addRow([%1.5f,%1.5f,null]);\n',usermatrix(1,i),usermatrix(2,i));
end
for i = 1 : size(itemmatrix,2)
  mfprintf(fh,'      data.addRow([%1.5f,null,%1.5f]);\n',itemmatrix(1,i),itemmatrix(2,i));
end


mfprintf(fh,'        // Create and draw the visualization.\n');
mfprintf(fh,'        var chart = new google.visualization.ScatterChart(\n');
mfprintf(fh,'          document.getElementById("'visualization"'));\n');
mfprintf(fh,'        chart.draw(data, {title: "'Feature Space"',\n');
mfprintf(fh,'                      width: 600, height: 400,\n');
mfprintf(fh,'                      vAxis: {title: "'Y"'},\n');
mfprintf(fh,'                      hAxis: {title: "'X"'}}\n');
mfprintf(fh,'              );\n');
mfprintf(fh,'}\n');
mfprintf(fh,'      google.setOnLoadCallback(drawVisualization);\n');
mfprintf(fh,'    </script>\n');
mfprintf(fh,'  </head>\n');
mfprintf(fh,'  <body style='"font-family: Arial;border: 0 none;'">\n');
mfprintf(fh,'    <div id='"visualization'" style='"width: 600px; height: 400px;'"></div>\n');
mfprintf(fh,'  </body>\n');
mfprintf(fh,'</html>\n');




mclose(fh);
endfunction

