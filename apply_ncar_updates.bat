@echo off 
REM #########################################################^M
REM # Applies NCAR-specific configurations to CatMDEdit,
REM # updating thesauri and adding our Contacts list. 
REM # Run this after installing CatMDEdit 
REM #   updated for ver.5.2.0 
REM #   added thesaurus changes - Jun 2, 2017
REM #   rearranged files - Jun 14 
REM #   numerous changes - Jul 10
REM #   based on catmdedit 4.6.6 to fix gml/ issue - Jul 18
REM #########################################################^M
echo.
set /P catBase= Enter the full path to the base CatMDEdit directory (e.g. C:\CatMDEdit): 
echo ""
echo "Press any key to update files within the %catBase% installation directory..."
echo ""
pause
REM ###########################
REM # add our dialects
REM ###########################
@echo on
xcopy /S "Expert Mode" "%catBase%\template\genericEditor\gui\Expert Mode" /i
xcopy /S "NCAR Dialect" "%catBase%\template\genericEditor\gui\NCAR Dialect" /i
copy template\*.xml "%catBase%\repository\templates"
copy /Y files\iso19115.xml "%catBase%\repository\standards"
REM copy /Y files\nmdedit-5.2.0.jar "%catBase%\lib\catmdedit-5.0.jar"
copy files\Default.theme "%catBase%"
copy files\*.gif "%catBase%\imagen\metadataEditorComponent"
copy /Y files\internat.properties "%catBase%"
copy /Y files\splash_Cat_5.0_NMDEdit.jpg "%catBase%\imagen\generalIcons"
copy /Y files\icons.properties "%catBase%"
REM copy files\NMDEdit.launch "%catBase%"
REM copy files\NMDEdit.properties "%catBase%"
copy files\about.html "%catBase%\doc\about"
copy files\ncar_highres_transparent.png "%catBase%\doc\about\about_files"
copy /Y files\gmxCodelists.xml "%catBase%\xml\schemas\ISO_19139_Schemas\resources\Codelist"
@echo off
REM ###########################
REM # add sample XML files 
REM ###########################
@echo on
del "%catBase%\repository\metadata\*.xml"
copy sample_XML\*.xml "%catBase%\repository\metadata"
@echo off
REM ###########################
REM # add our NCAR contacts
REM ###########################
@echo on
xcopy .\contact "%catBase%\repository\contact"
@echo off
REM #######################################################
REM # fix up thesaurus directory
REM #  add Resource Type and update CSDGM with new formats
REM #######################################################
@echo on
copy /Y files\CSDGM_FormatNameCode.dat "%catBase%\repository\thesaurus"
copy /Y files\CSDGM_FormatNameCode.MD.DC_externo.xml "%catBase%\repository\thesaurus"
copy "files\Resource Type.dat" "%catBase%\repository\thesaurus"
copy "files\md_Resource Type_en.xml" "%catBase%\repository\thesaurus"
@echo off
REM ###########################
REM # delete unneeded thesauri
REM ###########################
del "%catBase%\repository\thesaurus\ADLFTT.dat"
del "%catBase%\repository\thesaurus\ADLFTT.MD.DC.xml"
del "%catBase%\repository\thesaurus\AGROVOC.dat"
del "%catBase%\repository\thesaurus\AGROVOC.MD.DC.xml"
del "%catBase%\repository\thesaurus\CEODiscipline.dat"
del "%catBase%\repository\thesaurus\CEODisicpline.MD.DC.xml"
del "%catBase%\repository\thesaurus\CEOLocation.dat"
del "%catBase%\repository\thesaurus\CEOLocation.MD.DC.xml"
REM del "%catBase%\repository\thesaurus\DroughtVocabulary.dat"
REM del "%catBase%\repository\thesaurus\DroughtVocabulary.MD.DC.xml"
del "%catBase%\repository\thesaurus\EuropeanTerritorialUnits.dat"
del "%catBase%\repository\thesaurus\EuropeanTerritorialUnits.MD.DC.xml"
del "%catBase%\repository\thesaurus\EUROVOC.dat"
del "%catBase%\repository\thesaurus\EUROVOC.MD.DC.xml"
del "%catBase%\repository\thesaurus\GCMD.dat"
del "%catBase%\repository\thesaurus\GCMD.MD.DC.xml"
del "%catBase%\repository\thesaurus\GEMET.dat"
del "%catBase%\repository\thesaurus\GEMET.MD.DC.xml"
del "%catBase%\repository\thesaurus\INSPIRE_SpatialDataServicesClassification.dat"
del "%catBase%\repository\thesaurus\INSPIRE_SpatialDataServicesClassification.MD.DC.xml"
del "%catBase%\repository\thesaurus\INSPIRE_SpatialThemes.dat"
del "%catBase%\repository\thesaurus\INSPIRE_SpatialThemes.MD.DC.xml"
del "%catBase%\repository\thesaurus\ISO3166.dat"
del "%catBase%\repository\thesaurus\ISO3166.MD.DC.xml"
del "%catBase%\repository\thesaurus\MARC21_Keywords.MD.DC_externo.xml"
del "%catBase%\repository\thesaurus\MARC21_SubjectHeadings.dat"
del "%catBase%\repository\thesaurus\MARC21_SubjectHeadings.MD.DC_externo.xml"
del "%catBase%\repository\thesaurus\SBA_EuroGEOSS.MD.DC.xml"
del "%catBase%\repository\thesaurus\SBA.dat"
del "%catBase%\repository\thesaurus\UNESCO.dat"
del "%catBase%\repository\thesaurus\UNESCO.MD.DC.xml"
del "%catBase%\repository\thesaurus\URBISOC_MD.DC.xml"
del "%catBase%\repository\thesaurus\URBISOC.dat"
del "%catBase%\repository\thesaurus\WebServicesSpecification.MD.DC.xml"
REM ###################################################################################
REM # These files should be updated with latest versions to remove the Spanish titles
REM ###################################################################################
@echo on
copy files\MARC21_Keywords.MD.DC_externo.xml "%catBase%\repository\thesaurus"
copy files\WebServicesSpecification.MD.DC.xml "%catBase%\repository\thesaurus"
@echo off
REM ####################################################################################
@echo on
ren "%catBase%\CatMDEdit.bat" "NMDEdit.bat"
@echo off
echo "NMDEdit is now ready to use. CLick on the NMDEdit.bat file in the "%catBase% directory to start."
echo. 
echo.
pause

