<!--#include file="sifre.asp"-->
<%if 1>2 then%>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="3">
   <tr>
    <td onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';"  width="25%" valign="top"><div align="center">
      <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#999999">
        <tr>
          <td><table width="100%" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td colspan="2"><div align="center">
                <div align="center">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="34%"><a href="sayfa_sec.asp?sayfa=sayfa"><img src="images/firmalar.gif" width="95" height="95" border="0" /></a></td>
                      <td width="66%"><div align="center" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-weight: bold">SAYFALAR<br />
                        &#304;STAT&#304;ST&#304;KLER&#304;</div></td>
                    </tr>
                  </table>
                </div>
                <a href="sayfa_sec.asp?sayfa=haber"></a></div></td>
            </tr>
            <tr>
              <td width="56%"><div align="left">Toplam Sayfa</div></td>
              <td width="44%"><div align="left">:
                              
                  <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from sayfa "  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		   tf=rs.recordcount
		  %>
              </div></td>
            </tr>
            <tr>
              <td><div align="left"></div></td>
              <td><div align="left"></div></td>
            </tr>
          </table></td>
        </tr>
      </table>
      </div></td>
    <td onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';"  width="25%" valign="top"><div align="center">
      <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#999999">
        <tr>
          <td><table width="100%" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td colspan="2"><div align="center">
                <div align="center">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="34%"><a href="sayfa_sec.asp?sayfa=projeler"><img src="images/urun.gif" width="95" height="95" border="0" /></a></td>
                      <td width="66%"><div align="center" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-weight: bold">PROJELERÝMÝZ<br />
                        &#304;STAT&#304;ST&#304;KLER&#304;</div></td>
                    </tr>
                  </table>
                </div>
                <a href="sayfa_sec.asp?sayfa=haber"></a></div></td>
            </tr>
            <tr>
              <td width="61%"><div align="left">Toplam Proje </div></td>
              <td width="39%"><div align="left">:
                              
                  <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from paket "  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		   tf=rs.recordcount
		  %>
              </div></td>
            </tr>
            <tr>
              <td><div align="left">Onaylanmam&#305;&#351; Proje </div></td>
              <td><div align="left">:<strong><font size="2" color="#0000FF">
                <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from paket where goster=0"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		  %>
              </font></strong></div></td>
            </tr>
          </table></td>
        </tr>
      </table>
      </div></td>
    <td width="25%" valign="top" onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';"><div align="center">
      <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#666666">
        <tr>
          <td><table width="100%" border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td colspan="2"><div align="center">
                <div align="center">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="34%"><a href="sayfa_sec.asp?sayfa=rezervasyon"><img src="images/uyeler.gif" width="95" height="95" border="0" /></a></td>
                      <td width="66%"><div align="center" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-weight: bold">ONLÝNE REZERVASYON<br />
                        &#304;STAT&#304;ST&#304;KLER&#304;</div></td>
                    </tr>
                  </table>
                </div>
                <a href="sayfa_sec.asp?sayfa=haber"></a></div></td>
            </tr>
            <tr>
              <td width="56%"><div align="left">Toplam Rezervasyon </div></td>
              <td width="44%"><div align="left">:
                
                  <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from talepler"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		   tf=rs.recordcount
		  %>
              </div></td>
            </tr>
            <tr>
              <td><div align="left">Yeni Rezervasyon </div></td>
              <td><div align="left">:<strong><font size="2" color="#0000FF">
                <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from talepler where okundu=0"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		  %>
              </font></strong>              </div></td>
            </tr>
          </table></td>
        </tr>
      </table>
    </div></td>
    <td width="25%" valign="top" onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';"><div align="center">
      <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dddddd">
        <tr>
          <td valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="2">
              <tr>
                <td colspan="2"><div align="center">
                    <div align="center">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="34%"><a href="sayfa_sec.asp?sayfa=siparis"><img src="images/yorum.gif" width="95" height="95" border="0" /></a></td>
                          <td width="66%"><div align="center" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-weight: bold">ONL&#304;NE S&#304;PAR&#304;&#350; &#304;STAT&#304;ST&#304;KLER&#304;</div></td>
                        </tr>
                      </table>
                    </div>
                  <a href="sayfa_sec.asp?sayfa=haber"></a></div></td>
              </tr>
              <tr>
                <td width="56%"><div align="left">Toplam</div></td>
                <td width="44%"><div align="left">:
                  <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from talepler"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		   tf=rs.recordcount
		  %>
                </div></td>
              </tr>
              <tr>
                <td><div align="left">Okunmam&#305;&#351;</div></td>
                <td><div align="left">:<strong><font size="2" color="#0000FF">
                    <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from talepler where okundu=0"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		  %>
                </font></strong></div></td>
              </tr>
          </table></td>
        </tr>
      </table>
    </div></td>
  </tr>
   	<tr>
   	  <td onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" width="23%" ><div align="center">
   	    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#ddd">
          <tr>
            <td><table width="100%" border="0" cellspacing="2" cellpadding="2">
              <tr>
                <td colspan="2"><div align="center">
                  <div align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="34%"><a href="sayfa_sec.asp?sayfa=haber"><img src="images/haber.gif" width="95" height="95" border="0" /></a></td>
                        <td width="66%"><div align="center" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-weight: bold">S&#304;TE HABERLER&#304;<br />
                          &#304;STAT&#304;ST&#304;KLER&#304;</div></td>
                      </tr>
                    </table>
                  </div>
                  <a href="sayfa_sec.asp?sayfa=haber"></a></div></td>
              </tr>
              <tr>
                <td width="56%"><div align="left">Toplam Haber</div></td>
                <td width="44%"><div align="left">:
                  <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from haber "  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		   tf=rs.recordcount
		  %>
                </div></td>
              </tr>
              <tr>
                <td><div align="left">Onay Bekleyen</div></td>
                <td><div align="left">:<strong><font size="2" color="#0000FF">
                  <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from haber where goster=false"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		  %>
                </font></strong></div></td>
              </tr>
            </table></td>
          </tr>
        </table>
   	  </div></td>
   	  <td onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" width="23%" ><div align="center">
   	    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#ddd">
          <tr>
            <td><table width="100%" border="0" cellspacing="2" cellpadding="2">
              <tr>
                <td colspan="2"><div align="center">
                  <div align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="34%"><a href="sayfa_sec.asp?sayfa=defter"><img src="images/defter.gif" width="95" height="95" border="0" /></a></td>
                        <td width="66%"><div align="center" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-weight: bold">Z&#304;YARET&Ccedil;&#304; DEFTER&#304;<br />
                          &#304;STAT&#304;ST&#304;KLER&#304;</div></td>
                      </tr>
                    </table>
                  </div>
                  <a href="sayfa_sec.asp?sayfa=haber"></a></div></td>
              </tr>
              <tr>
                <td width="56%"><div align="left">Toplam Mesaj</div></td>
                <td width="44%"><div align="left">:
                  <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from mesaj "  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		   tf=rs.recordcount
		  %>
                </div></td>
              </tr>
              <tr>
                <td><div align="left">Onay Bekleyen</div></td>
                <td><div align="left">:<strong><font size="2" color="#0000FF">
                  <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from mesaj where onay=false"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		  %>
                </font></strong></div></td>
              </tr>
            </table></td>
          </tr>
        </table>
   	  </div></td>
   	  <td onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" ><div align="center">
        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#ddd">
          <tr>
            <td valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="2">
                <tr>
                  <td colspan="2"><div align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="34%"><a href="sayfa_sec.asp?sayfa=galeri"><img src="../images/galeriyok.png" width="95" height="95" border="0" /></a></td>
                        <td width="66%"><div align="center" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-weight: bold">RES&#304;M GALER&#304;S&#304;<br />
                          &#304;STAT&#304;ST&#304;KLER&#304;</div></td>
                      </tr>
                    </table>
                  </div></td>
                </tr>
                <tr>
                  <td width="56%"><div align="left">Toplam Resim</div></td>
                  <td width="44%"><div align="left">:
                    <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from galeri "  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		   tf=rs.recordcount
		  %>
                  </div></td>
                </tr>
                <tr>
                  <td><div align="left">Onay Bekleyen</div></td>
                  <td><div align="left">:<strong><font size="2" color="#0000FF">
                      <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from galeri where onay=0"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		  %>
                  </font></strong></div></td>
                </tr>

            </table></td>
          </tr>
        </table>
      </div></td>
      <td onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" ><div align="center">
        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#ddd">
          <tr>
            <td><table width="100%" border="0" cellspacing="2" cellpadding="2">
                <tr>
                  <td colspan="2"><div align="center">
                      <div align="center">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="34%"><a href="sayfa_sec.asp?sayfa=formmail"><img src="images/formmail.gif" width="95" height="95" border="0" /></a></td>
                            <td width="66%"><div align="center" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; font-weight: bold">S&#304;TE FORMMA&#304;L &#304;STAT&#304;ST&#304;KLER&#304;</div></td>
                          </tr>
                        </table>
                      </div>
                    <a href="sayfa_sec.asp?sayfa=haber"></a></div></td>
                </tr>
                <tr>
                  <td width="56%"><div align="left">Toplam Mail</div></td>
                  <td width="44%"><div align="left">:
                    <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from formmail "  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		   tf=rs.recordcount
		  %>
                  </div></td>
                </tr>
                <tr>
                  <td><div align="left">Okunmam&#305;&#351; Mail</div></td>
                  <td><div align="left">:<strong><font size="2" color="#0000FF">
                      <%
		   Set Rs=Server.CreateObject("Adodb.Recordset")
 		   sorgum="Select * from formmail where durum=false"  
		   Rs.Open Sorgum, Baglantim, 1, 3 
		   Response.Write rs.recordcount
		  %>
                  </font></strong></div></td>
                </tr>
            </table></td>
          </tr>
        </table>
      </div></td>
  </tr>
        </table>
<%end if%>
