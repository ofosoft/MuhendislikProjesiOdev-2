<%	ay=month(Now)
		gun=day(now)
		sorgum="Select * from olay where ay="&"'"&ay&"'"&" and gun="&"'"&gun&"'"
		Rl.Open Sorgum, Baglantim, 1, 3 %>
	
	<% if rl("soz")<>"" then %>
	<em class="kucukmetin">Günün Sözü</em><br>
		<%= rl("soz") %>
	<% end if%>
	<br><em class="kucukmetin">Tarihte Bugün</em><br>
		<% if rl("olay1")<>"" then %> » <%= rl("olay1")&"<br>" %><%end if%>
		<% if rl("olay2")<>"" then %> » <%= rl("olay2")&"<br>" %><%end if%>
		<% if rl("olay3")<>"" then %> » <%= rl("olay3")&"<br>" %><%end if%>
<%  rl.close %>