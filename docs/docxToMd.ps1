$docsFolder = "docs"
$postOutput = '../_posts';
$docxOutput = $docsFolder + '/processed';
$date = Get-Date -UFormat "%Y-%m-%d";

Get-ChildItem ./queue/ | ForEach-Object { 
    $name = $_.Name.Trim('.docx');
    $postName = $date + '-' + $name + '.md';
    $pageDownload = '/' + $docxOutput + '/' + $_.Name
    Write-Output $postName

    pandoc -s $_.FullName -t gfm -o $postName 
    $frontMatter = @(
        "---",
        "#see https://github.com/Feelav/LittleRatura/blob/master/README.md Posting new books",
        "title: title",
        "layout: post",
        "tags: []",
        $("pageDownload: " + $pageDownload),
        "---",
        "")
    $frontMatter + (Get-Content $postName) | Set-Content $postName
   
    Move-Item $_.FullName $('../' + $docxOutput) 
    Move-Item $postName $postOutput
    
}
Write-Output 'DONE'
