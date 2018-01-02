<!--#include file="sifre.asp"-->
<% 
	if Request.QueryString("sil")="eminim" and Request.QueryString("id")<>"" then
		rs.open "delete * from mesaj where id="&Request.QueryString("id") , baglantim ,1,3
	end if 
%>
<% 
	if Request.QueryString("aktif")="eminim" and Request.QueryString("id")<>"" then
		sorgum="Select * from mesaj Where id = "&id&""
		rs.Open Sorgum, Baglantim, 1, 3  
		rs("onay") = True
		rs.Update
		rs.close
	end if 
%>
<% 
	if Request.QueryString("pasif")="eminim" and Request.QueryString("id")<>"" then
		sorgum="Select * from mesaj Where id = "&id&""
		rs.Open Sorgum, Baglantim, 1, 3  
		rs("onay") = False
		rs.Update
		rs.close
	end if 
%>

<table width="100%" border="0" cellpadding="5" cellspacing="5" id="Table_01">
  <tr>
    <td colspan="3" bgcolor="#FFFFFF">
        <% 	
	sorgum="Select * from mesaj order by id desc"
	rs.Open Sorgum, Baglantim, 1, 3  
	if rs.eof or rs.bof then 
		Response.Write("<center>Defterde Mesaj Yok.</center></td></tr></table>  ")
	else
	    shf = Request.QueryString("shf")
		if shf="" then shf=1 end if %>
        <% rs.pagesize = 5 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  									
		   for i=1 to 5
			  if rs.eof then exit for 
			  If i mod 2 Then  
		       Response.Write("")
			  End If  %>
       
		<table width="99%" align="center" border="0" cellpadding="3" cellspacing="0" bgcolor="#FFFFff" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px"  onmouseover="this.style.backgroundColor='#f7f5c4';" 
				    onmouseout="this.style.backgroundColor='#FFFFff';">
          <tr >
            <td width="1"></td>
            <td width="1047" valign="top"><p><storng>
                <span style="font-weight: bold">Ad&#305; :</span> <%= Rs("adi") %></strong> - <span style="font-weight: bold">&#350;ehir :</span> <%=rs("sehir")%> - <span style="font-weight: bold">Cinsiyeti : </span><%=rs("cinsiyet")%></p>
              <p>
              <table width="95%" border="0" cellspacing="2" cellpadding="2">
                <tr>
                  <td colspan="2"><%= Rs("mesaj")%></td>
                  </tr>
                <%if rs("cevap")<>"" then%>
                <tr>
                  <td width="20">&nbsp;</td>
                  <td bgcolor="#DFF4F2"><span style="font-weight: bold">Cevab&#305;n&#305;z :</span> <%= Rs("cevap")%></td>
                </tr>
                 <%end if%> 
              </table>
              </p>
              <p><span style="font-weight: bold">Tarih :</span> <%=rs("tarih")%> -<span style="font-weight: bold"> Mail :</span> <%=rs("mail")%> - <span style="font-weight: bold">Web :</span> <%=rs("web")%> - <span style="font-weight: bold">Ip : </span><%=rs("ip")%></p>
              </td><td width="50" valign="middle"><div align="center"><img src="images/cevap.jpg" onClick="yenipencere('cevapyaz.asp?id=<%= rs("id")%>',400,400)" style="cursor:hand;"> 
			        <br><img src="images/duzelt.gif" onClick="yenipencere('defterduzelt.asp?id=<%= rs("id")%>',400,400)" style="cursor:hand;"> <br />
			        <%if rs("onay")=True then%>
			        <a href="?pasif=eminim&amp;id=<%= rs("id") %>"><img src="images/pasifet.gif" border="0"></a>
			        <%else%>
			        <a href="?aktif=eminim&amp;id=<%= rs("id") %>"><img src="images/aktifet.gif" border="0"></a>
			        <%end if%>
			        <br />
			        <a href="?sil=eminim&amp;id=<%= rs("id") %>" onclick="return confirm('Dikkat ! Ziyaretçinin Mesaji Silinecektir.')"><img src="images/sil.gif" width="70" height="20"  border="0"></a>
			       
              </div></td>
          </tr>
        </table><br />
		

        <%	rs.movenext
			next %>
	<table width="99%" align="center" border="0" cellpadding="3" cellspacing="0" bgcolor="#FFFFff" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px"><tr><td>
        <div align="center">
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<strong><%= y %> | </strong>
							<% else %>
				 			 <a href="?sayfa=defter&shf=<%= y %>"><%= y %> | </a>	
							<% end if
		                 next %>
        
        </div></td></tr></table>
      
    </td>
  </tr>
</table><% end if %>
