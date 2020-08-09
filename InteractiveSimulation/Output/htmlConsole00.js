var file = document.getElementById('file');
var result = document.getElementById('result');
 
// check file API can be used
if(window.File && window.FileReader && window.FileList && window.Blob)
{
    function loadLocalCsv(e)
	{
        // get file information
        var fileData = e.target.files[0];
		console.log(fileData); // check file information
		
        // stop operation if file selected is not csv
        if(!fileData.name.match('.csv$'))
		{
            alert('file selected is not scv');
            return;
        }
		
        // read file by FileReader object
        var reader = new FileReader();
        
		// process when file reading operaetion is success
        reader.onload = function()
		{
            var cols = reader.result.split('\n');
            var data = [];
			
            for (var i = 0; i < cols.length; i++)
			{
                data[i] = cols[i].split(',');
            }
            
			var insert = createTable(data);
            result.appendChild(insert);
        }
		
        // execute file reading operation
        reader.readAsText(fileData);
    }
    file.addEventListener('change', loadLocalCsv, false);
}
else
{
    file.style.display = 'none';
    result.innerHTML = 'Please use browser which can operate File API';
}
 
function createTable(data)
{
    var table = document.createElement('table');
    
	for (var i = 0; i < data.length; i++)
	{
        var tr = document.createElement('tr');
		
        for (var j = 0; j < data[i].length; j++)
		{
            var td = document.createElement('td');
            td.innerText = data[i][j];
            tr.appendChild(td);
        }
        table.appendChild(tr);
    }
    return table;
}
