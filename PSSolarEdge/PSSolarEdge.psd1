@{
	# Script module or binary module file associated with this manifest
	RootModule = 'PSSolarEdge.psm1'
	
	# Version number of this module.
	ModuleVersion = '0.0.1'
	
	# ID used to uniquely identify this module
	GUID = '1669a97e-70fc-45d9-a1c1-b4f234fc0c69'
	
	# Author of this module
	Author = 'Tom Robijns'
	
	# Company or vendor of this module
	CompanyName = ''
	
	# Copyright statement for this module
	Copyright = 'Copyright (c) 2019 Tom Robijns'
	
	# Description of the functionality provided by this module
	Description = 'PowerShell wrapper for SolarEdge API'
	
	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '5.0'
	
	# Modules that must be imported into the global environment prior to importing
	# this module
	RequiredModules = @(
		@{ ModuleName='PSFramework'; ModuleVersion='1.1.59' }
	)
	
	# Assemblies that must be loaded prior to importing this module
	# RequiredAssemblies = @('bin\PSSolarEdge.dll')
	
	# Type files (.ps1xml) to be loaded when importing this module
	# TypesToProcess = @('xml\PSSolarEdge.Types.ps1xml')
	
	# Format files (.ps1xml) to be loaded when importing this module
	# FormatsToProcess = @('xml\PSSolarEdge.Format.ps1xml')
	
	# Functions to export from this module
	FunctionsToExport = 'Connect-SolarEdge'
	
	# Cmdlets to export from this module
	CmdletsToExport = ''
	
	# Variables to export from this module
	VariablesToExport = ''
	
	# Aliases to export from this module
	AliasesToExport = ''
	
	# List of all modules packaged with this module
	ModuleList = @()
	
	# List of all files packaged with this module
	FileList = @()
	
	# Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData = @{
		
		#Support for PowerShellGet galleries.
		PSData = @{
			
			# Tags applied to this module. These help with module discovery in online galleries.
			Tags = @('Windows','PSEdition_Desktop')
			
			# A URL to the license for this module.
			LicenseUri = 'https://github.com/trir262/PSSolarEdge/blob/master/LICENSE'
			
			# A URL to the main website for this project.
			ProjectUri = 'https://github.com/trir262/PSSolarEdge'
			
			# A URL to an icon representing this module.
			# IconUri = ''
			
			# Prerelease version, we are not ready yet
			Prerelease = 'alpha'

			# ReleaseNotes of this module
			ReleaseNotes = '0.0 Initial version of the PSSolarEdge Module'
			
		} # End of PSData hashtable
		
	} # End of PrivateData hashtable
}