<%
Dim arrBaseFolder
Redim arrBaseFolder(4)
Dim arrBaseName
Redim arrBaseName(4)

Dim bReturnAbsolute
bReturnAbsolute=false

if Session("yol")<>"" then

	arrBaseFolder(0)=Session("yol")
	arrBaseName(0)="Sizin Klasör"

else

if session("fkodu")<>""	then

		yol0="/firmalar/"&Session("fkodu")&"/logo/"
		yol1="/firmalar/"&Session("fkodu")&"/urun/"
		yol2="/firmalar/"&Session("fkodu")&"/diger/"
		
		arrBaseFolder(0)=yol0
		arrBaseName(0)="Firma Logo"
		
		arrBaseFolder(1)=yol1
		arrBaseName(1)="Firma Urun"
		
		arrBaseFolder(2)=yol2
		arrBaseName(2)="Diger Multimedia"
else

		arrBaseFolder(0)="/Editor_Multimedia/"'Use "Relative to Root" Path
		arrBaseName(0)="Editor_Multimedia"
		
		arrBaseFolder(1)="/haber_resimleri/"
		arrBaseName(1)="Haber Resimleri"
		
		arrBaseFolder(2)="/diger_resimler"
		arrBaseName(2)="Diðer Resimleri"
	
		arrBaseFolder(3)="/Reklam/"
		arrBaseName(3)="Reklam Çalýþmlarý"
end if

end if

%>
