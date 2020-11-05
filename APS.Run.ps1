﻿#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: 9c9be188-17e2-4157-bdde-35ca5042181c
# Source File: C:\Users\hrbnkh\Documents\SAPIEN\PowerShell Studio\Projects\APS\APS.psproj
#------------------------------------------------------------------------
<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172
     Generated on:       11/5/2020 12:14 PM
     Generated by:       hrbnkh
    --------------------------------------------------------------------------------
    .DESCRIPTION
        Script generated by PowerShell Studio 2020
#>



#region Source: Startup.pss
#----------------------------------------------
#region Import Assemblies
#----------------------------------------------
#endregion Import Assemblies

#Define a Param block to use custom parameters in the project
#Param ($CustomParameter)

function Main {
<#
    .SYNOPSIS
        The Main function starts the project application.
    
    .PARAMETER Commandline
        $Commandline contains the complete argument string passed to the script packager executable.
    
    .NOTES
        Use this function to initialize your script and to call GUI forms.
		
    .NOTES
        To get the console output in the Packager (Forms Engine) use: 
		$ConsoleOutput (Type: System.Collections.ArrayList)
#>
	Param ([String]$Commandline)
		
	#--------------------------------------------------------------------------
	#TODO: Add initialization script here (Load modules and check requirements)
	
	
	#--------------------------------------------------------------------------
	
	if((Show-MainForm_psf) -eq 'OK')
	{
		
	}
	
	$script:ExitCode = 0 #Set the exit code for the Packager
}


#endregion Source: Startup.pss

#region Source: Globals.ps1
	#--------------------------------------------
	# Declare Global Variables and Functions here
	#--------------------------------------------
	
	
	#Sample function that provides the location of the script
	function Get-ScriptDirectory
	{
	<#
		.SYNOPSIS
			Get-ScriptDirectory returns the proper location of the script.
	
		.OUTPUTS
			System.String
		
		.NOTES
			Returns the correct path within a packaged executable.
	#>
		[OutputType([string])]
		param ()
		if ($null -ne $hostinvocation)
		{
			Split-Path $hostinvocation.MyCommand.path
		}
		else
		{
			Split-Path $script:MyInvocation.MyCommand.Path
		}
	}
	
	#Sample variable that provides the location of the script
	[string]$ScriptDirectory = Get-ScriptDirectory
	
	
	
#endregion Source: Globals.ps1

#region Source: MainForm.psf
function Show-MainForm_psf
{
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Design, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$form1 = New-Object 'System.Windows.Forms.Form'
	$tabcontrol1 = New-Object 'System.Windows.Forms.TabControl'
	$tabpage1 = New-Object 'System.Windows.Forms.TabPage'
	$labelLoadAPSKey = New-Object 'System.Windows.Forms.Label'
	$buttonLoad = New-Object 'System.Windows.Forms.Button'
	$tabpage2 = New-Object 'System.Windows.Forms.TabPage'
	$textboxCreatePassword = New-Object 'System.Windows.Forms.TextBox'
	$Password = New-Object 'System.Windows.Forms.Label'
	$textboxCreateLog = New-Object 'System.Windows.Forms.TextBox'
	$textboxCreateFileName = New-Object 'System.Windows.Forms.TextBox'
	$textboxCreateLogin = New-Object 'System.Windows.Forms.TextBox'
	$comboboxCreateType = New-Object 'System.Windows.Forms.ComboBox'
	$labelFilename = New-Object 'System.Windows.Forms.Label'
	$labelYouLogin = New-Object 'System.Windows.Forms.Label'
	$Type = New-Object 'System.Windows.Forms.Label'
	$buttonCreate = New-Object 'System.Windows.Forms.Button'
	$menustrip1 = New-Object 'System.Windows.Forms.MenuStrip'
	$fileToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$exitToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$editToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$copyToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$pasteToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$helpToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$aboutToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$form1_Load={
		#TODO: Initialize Form Controls here
		
	}
	
	
	$exitToolStripMenuItem_Click={
		#TODO: Place custom script here
		$form1.Close()
	}
	
	$aboutToolStripMenuItem_Click={
		#TODO: Place custom script here
		[System.Windows.Forms.MessageBox]::Show("Menu Application v1.0","Menu Application");
	}
	
	
	
	#region Control Helper Functions
	function Update-ComboBox
	{
	<#
		.SYNOPSIS
			This functions helps you load items into a ComboBox.
		
		.DESCRIPTION
			Use this function to dynamically load items into the ComboBox control.
		
		.PARAMETER ComboBox
			The ComboBox control you want to add items to.
		
		.PARAMETER Items
			The object or objects you wish to load into the ComboBox's Items collection.
		
		.PARAMETER DisplayMember
			Indicates the property to display for the items in this control.
			
		.PARAMETER ValueMember
			Indicates the property to use for the value of the control.
		
		.PARAMETER Append
			Adds the item(s) to the ComboBox without clearing the Items collection.
		
		.EXAMPLE
			Update-ComboBox $combobox1 "Red", "White", "Blue"
		
		.EXAMPLE
			Update-ComboBox $combobox1 "Red" -Append
			Update-ComboBox $combobox1 "White" -Append
			Update-ComboBox $combobox1 "Blue" -Append
		
		.EXAMPLE
			Update-ComboBox $combobox1 (Get-Process) "ProcessName"
		
		.NOTES
			Additional information about the function.
	#>
		
		param
		(
			[Parameter(Mandatory = $true)]
			[ValidateNotNull()]
			[System.Windows.Forms.ComboBox]
			$ComboBox,
			[Parameter(Mandatory = $true)]
			[ValidateNotNull()]
			$Items,
			[Parameter(Mandatory = $false)]
			[string]$DisplayMember,
			[Parameter(Mandatory = $false)]
			[string]$ValueMember,
			[switch]
			$Append
		)
		
		if (-not $Append)
		{
			$ComboBox.Items.Clear()
		}
		
		if ($Items -is [Object[]])
		{
			$ComboBox.Items.AddRange($Items)
		}
		elseif ($Items -is [System.Collections.IEnumerable])
		{
			$ComboBox.BeginUpdate()
			foreach ($obj in $Items)
			{
				$ComboBox.Items.Add($obj)
			}
			$ComboBox.EndUpdate()
		}
		else
		{
			$ComboBox.Items.Add($Items)
		}
		
		$ComboBox.DisplayMember = $DisplayMember
		$ComboBox.ValueMember = $ValueMember
	}
	#endregion
	
	$buttonCreate_Click={
		#TODO: Place custom script here
		#initials parameters
		$Type = $comboboxCreateType.SelectedItem;
		$ADlogin = $textboxCreateLogin.Text;
		$filename = $textboxCreateFileName.Text;
		
		$textboxCreateLog.Text += $Type + $ADlogin +$filename + "test" 
		
		
		
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$form1.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
		$script:MainForm_textboxCreatePassword = $textboxCreatePassword.Text
		$script:MainForm_textboxCreateLog = $textboxCreateLog.Text
		$script:MainForm_textboxCreateFileName = $textboxCreateFileName.Text
		$script:MainForm_textboxCreateLogin = $textboxCreateLogin.Text
		$script:MainForm_comboboxCreateType = $comboboxCreateType.Text
		$script:MainForm_comboboxCreateType_SelectedItem = $comboboxCreateType.SelectedItem
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonCreate.remove_Click($buttonCreate_Click)
			$form1.remove_Load($form1_Load)
			$exitToolStripMenuItem.remove_Click($exitToolStripMenuItem_Click)
			$aboutToolStripMenuItem.remove_Click($aboutToolStripMenuItem_Click)
			$form1.remove_Load($Form_StateCorrection_Load)
			$form1.remove_Closing($Form_StoreValues_Closing)
			$form1.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$form1.SuspendLayout()
	$menustrip1.SuspendLayout()
	$tabcontrol1.SuspendLayout()
	$tabpage1.SuspendLayout()
	$tabpage2.SuspendLayout()
	#
	# form1
	#
	$form1.Controls.Add($tabcontrol1)
	$form1.Controls.Add($menustrip1)
	$form1.AutoScaleDimensions = '6, 13'
	$form1.AutoScaleMode = 'Font'
	$form1.ClientSize = '493, 467'
	$form1.MainMenuStrip = $menustrip1
	$form1.Name = 'form1'
	$form1.StartPosition = 'CenterScreen'
	$form1.Text = 'Form'
	$form1.add_Load($form1_Load)
	#
	# tabcontrol1
	#
	$tabcontrol1.Controls.Add($tabpage1)
	$tabcontrol1.Controls.Add($tabpage2)
	$tabcontrol1.Location = '0, 27'
	$tabcontrol1.Name = 'tabcontrol1'
	$tabcontrol1.SelectedIndex = 0
	$tabcontrol1.Size = '493, 440'
	$tabcontrol1.TabIndex = 3
	#
	# tabpage1
	#
	$tabpage1.Controls.Add($labelLoadAPSKey)
	$tabpage1.Controls.Add($buttonLoad)
	$tabpage1.Location = '4, 22'
	$tabpage1.Name = 'tabpage1'
	$tabpage1.Padding = '3, 3, 3, 3'
	$tabpage1.Size = '485, 414'
	$tabpage1.TabIndex = 0
	$tabpage1.Text = 'View'
	$tabpage1.UseVisualStyleBackColor = $True
	#
	# labelLoadAPSKey
	#
	$labelLoadAPSKey.AutoSize = $True
	$labelLoadAPSKey.Location = '8, 12'
	$labelLoadAPSKey.Name = 'labelLoadAPSKey'
	$labelLoadAPSKey.Size = '76, 17'
	$labelLoadAPSKey.TabIndex = 2
	$labelLoadAPSKey.Text = 'Load APS key'
	$labelLoadAPSKey.UseCompatibleTextRendering = $True
	#
	# buttonLoad
	#
	$buttonLoad.Location = '402, 12'
	$buttonLoad.Name = 'buttonLoad'
	$buttonLoad.Size = '75, 23'
	$buttonLoad.TabIndex = 1
	$buttonLoad.Text = 'Load'
	$buttonLoad.UseCompatibleTextRendering = $True
	$buttonLoad.UseVisualStyleBackColor = $True
	#
	# tabpage2
	#
	$tabpage2.Controls.Add($textboxCreatePassword)
	$tabpage2.Controls.Add($Password)
	$tabpage2.Controls.Add($textboxCreateLog)
	$tabpage2.Controls.Add($textboxCreateFileName)
	$tabpage2.Controls.Add($textboxCreateLogin)
	$tabpage2.Controls.Add($comboboxCreateType)
	$tabpage2.Controls.Add($labelFilename)
	$tabpage2.Controls.Add($labelYouLogin)
	$tabpage2.Controls.Add($Type)
	$tabpage2.Controls.Add($buttonCreate)
	$tabpage2.Location = '4, 22'
	$tabpage2.Name = 'tabpage2'
	$tabpage2.Padding = '3, 3, 3, 3'
	$tabpage2.Size = '485, 414'
	$tabpage2.TabIndex = 1
	$tabpage2.Text = 'Creating'
	$tabpage2.UseVisualStyleBackColor = $True
	#
	# textboxCreatePassword
	#
	$textboxCreatePassword.Location = '127, 127'
	$textboxCreatePassword.Name = 'textboxCreatePassword'
	$textboxCreatePassword.Size = '121, 20'
	$textboxCreatePassword.TabIndex = 9
	$textboxCreatePassword.UseSystemPasswordChar = $True
	#
	# Password
	#
	$Password.AutoSize = $True
	$Password.Location = '19, 127'
	$Password.Name = 'Password'
	$Password.Size = '54, 17'
	$Password.TabIndex = 8
	$Password.Text = 'Password'
	$Password.UseCompatibleTextRendering = $True
	#
	# textboxCreateLog
	#
	$textboxCreateLog.Location = '19, 156'
	$textboxCreateLog.Multiline = $True
	$textboxCreateLog.Name = 'textboxCreateLog'
	$textboxCreateLog.Size = '229, 171'
	$textboxCreateLog.TabIndex = 7
	#
	# textboxCreateFileName
	#
	$textboxCreateFileName.Location = '127, 101'
	$textboxCreateFileName.Name = 'textboxCreateFileName'
	$textboxCreateFileName.Size = '121, 20'
	$textboxCreateFileName.TabIndex = 6
	#
	# textboxCreateLogin
	#
	$textboxCreateLogin.Location = '127, 60'
	$textboxCreateLogin.Name = 'textboxCreateLogin'
	$textboxCreateLogin.Size = '121, 20'
	$textboxCreateLogin.TabIndex = 5
	#
	# comboboxCreateType
	#
	$comboboxCreateType.FormattingEnabled = $True
	[void]$comboboxCreateType.Items.Add('On group')
	[void]$comboboxCreateType.Items.Add('Just for you')
	$comboboxCreateType.Location = '127, 27'
	$comboboxCreateType.Name = 'comboboxCreateType'
	$comboboxCreateType.Size = '121, 21'
	$comboboxCreateType.TabIndex = 4
	#
	# labelFilename
	#
	$labelFilename.AutoSize = $True
	$labelFilename.Location = '19, 101'
	$labelFilename.Name = 'labelFilename'
	$labelFilename.Size = '51, 17'
	$labelFilename.TabIndex = 3
	$labelFilename.Text = 'Filename'
	$labelFilename.UseCompatibleTextRendering = $True
	#
	# labelYouLogin
	#
	$labelYouLogin.AutoSize = $True
	$labelYouLogin.Location = '19, 60'
	$labelYouLogin.Name = 'labelYouLogin'
	$labelYouLogin.Size = '51, 17'
	$labelYouLogin.TabIndex = 2
	$labelYouLogin.Text = 'You login'
	$labelYouLogin.UseCompatibleTextRendering = $True
	#
	# Type
	#
	$Type.AutoSize = $True
	$Type.Location = '19, 27'
	$Type.Name = 'Type'
	$Type.Size = '29, 17'
	$Type.TabIndex = 1
	$Type.Text = 'Type'
	$Type.UseCompatibleTextRendering = $True
	#
	# buttonCreate
	#
	$buttonCreate.Location = '173, 333'
	$buttonCreate.Name = 'buttonCreate'
	$buttonCreate.Size = '75, 23'
	$buttonCreate.TabIndex = 0
	$buttonCreate.Text = 'Create'
	$buttonCreate.UseCompatibleTextRendering = $True
	$buttonCreate.UseVisualStyleBackColor = $True
	$buttonCreate.add_Click($buttonCreate_Click)
	#
	# menustrip1
	#
	[void]$menustrip1.Items.Add($fileToolStripMenuItem)
	[void]$menustrip1.Items.Add($editToolStripMenuItem)
	[void]$menustrip1.Items.Add($helpToolStripMenuItem)
	$menustrip1.Location = '0, 0'
	$menustrip1.Name = 'menustrip1'
	$menustrip1.Size = '493, 24'
	$menustrip1.TabIndex = 0
	$menustrip1.Text = 'menustrip1'
	#
	# fileToolStripMenuItem
	#
	[void]$fileToolStripMenuItem.DropDownItems.Add($exitToolStripMenuItem)
	$fileToolStripMenuItem.Name = 'fileToolStripMenuItem'
	$fileToolStripMenuItem.Size = '37, 20'
	$fileToolStripMenuItem.Text = 'File'
	#
	# exitToolStripMenuItem
	#
	$exitToolStripMenuItem.Name = 'exitToolStripMenuItem'
	$exitToolStripMenuItem.Size = '93, 22'
	$exitToolStripMenuItem.Text = 'Exit'
	$exitToolStripMenuItem.add_Click($exitToolStripMenuItem_Click)
	#
	# editToolStripMenuItem
	#
	[void]$editToolStripMenuItem.DropDownItems.Add($copyToolStripMenuItem)
	[void]$editToolStripMenuItem.DropDownItems.Add($pasteToolStripMenuItem)
	$editToolStripMenuItem.Name = 'editToolStripMenuItem'
	$editToolStripMenuItem.Size = '39, 20'
	$editToolStripMenuItem.Text = 'Edit'
	#
	# copyToolStripMenuItem
	#
	$copyToolStripMenuItem.Name = 'copyToolStripMenuItem'
	$copyToolStripMenuItem.ShortcutKeys = [System.Windows.Forms.Keys]::C -bor [System.Windows.Forms.Keys]::Control 
	$copyToolStripMenuItem.Size = '144, 22'
	$copyToolStripMenuItem.Text = 'Copy'
	#
	# pasteToolStripMenuItem
	#
	$pasteToolStripMenuItem.Name = 'pasteToolStripMenuItem'
	$pasteToolStripMenuItem.ShortcutKeys = [System.Windows.Forms.Keys]::V -bor [System.Windows.Forms.Keys]::Control 
	$pasteToolStripMenuItem.Size = '144, 22'
	$pasteToolStripMenuItem.Text = 'Paste'
	#
	# helpToolStripMenuItem
	#
	[void]$helpToolStripMenuItem.DropDownItems.Add($aboutToolStripMenuItem)
	$helpToolStripMenuItem.Name = 'helpToolStripMenuItem'
	$helpToolStripMenuItem.Size = '44, 20'
	$helpToolStripMenuItem.Text = 'Help'
	#
	# aboutToolStripMenuItem
	#
	$aboutToolStripMenuItem.Name = 'aboutToolStripMenuItem'
	$aboutToolStripMenuItem.Size = '107, 22'
	$aboutToolStripMenuItem.Text = 'About'
	$aboutToolStripMenuItem.add_Click($aboutToolStripMenuItem_Click)
	$tabpage2.ResumeLayout()
	$tabpage1.ResumeLayout()
	$tabcontrol1.ResumeLayout()
	$menustrip1.ResumeLayout()
	$form1.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $form1.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$form1.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$form1.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$form1.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $form1.ShowDialog()

}
#endregion Source: MainForm.psf

#Start the application
Main ($CommandLine)