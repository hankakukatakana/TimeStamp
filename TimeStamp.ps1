Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms

New-Item .\Result.txt -ItemType file -Force

function Time_Stamp(){
	$Time = (Get-Date).ToString("HH:mm")
    $Stamp.Text = "$Time"
    Write-Output $Time |Add-Content .\Result.txt
}
function Txt_Open(){
    .\Result.txt
}
function Txt_Clear(){
    New-Item .\Result.txt -ItemType file -Force
}

$Form = New-Object System.Windows.Forms.Form
	$Form.Size = New-Object System.Drawing.Size(250,100)
	$Form.Text = "TimeStamp"

$Stamp = New-Object System.Windows.Forms.Textbox
	$Stamp.Location = New-Object System.Drawing.Point(0,0)
	$Stamp.Size = New-Object System.Drawing.Size(200,20)
	$Stamp.Text = ""
	$Stamp.Multiline = $True
$Form.Controls.Add($Stamp)

$DateBtn = New-Object System.Windows.Forms.Button
	$DateBtn.Location = New-Object System.Drawing.Point(0,30)
	$DateBtn.Size = New-Object System.Drawing.Size(100,30)
	$DateBtn.Text = "Date"
$Form.Controls.Add($DateBtn)
$DateBtn.Add_Click({Time_Stamp})

$TxtBtn = New-Object System.Windows.Forms.Button
	$TxtBtn.Location = New-Object System.Drawing.Point(100,30)
	$TxtBtn.Size = New-Object System.Drawing.Size(50,30)
	$TxtBtn.Text = "txt"
$Form.Controls.Add($TxtBtn)
$TxtBtn.Add_Click({Txt_Open})

$ClearBtn = New-Object System.Windows.Forms.Button
	$ClearBtn.Location = New-Object System.Drawing.Point(150,30)
	$ClearBtn.Size = New-Object System.Drawing.Size(50,30)
	$ClearBtn.Text = "txt"
$Form.Controls.Add($ClearBtn)
$ClearBtn.Add_Click({Txt_Clear})

$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()