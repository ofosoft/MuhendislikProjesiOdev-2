<?xml version="1.0"  encoding="ISO-8859-9" standalone="yes"?> 
<%kays=cint(session("kayanresimsayisi"))
resim=session("kayanresimurl-1")
adi=session("kayanresimadi-1")
resim1="resimler/galeri/1.jpg"%>
  <Piecemaker>
  <Contents>
<%for i=1 to kays%><Image Source="<%=session("kayanresimurl-"&i&"")%>" Title="<%=session("kayanresimadi-"&i&"")%>"></Image><%next%>
  </Contents>
  <Settings ImageWidth="530" ImageHeight="300" LoaderColor="0x333333" InnerSideColor="0x222222" SideShadowAlpha="0.8" DropShadowAlpha="0.7" DropShadowDistance="0" DropShadowScale="0.95" DropShadowBlurX="40" DropShadowBlurY="4" MenuDistanceX="20" MenuDistanceY="10" MenuColor1="0x106ab3" MenuColor2="0xFF0000" MenuColor3="0x000000" ControlSize="50" ControlDistance="20" ControlColor1="0x222222" ControlColor2="0xf8f8f8" ControlAlpha="0.8" ControlAlphaOver="0.95" ControlsX="250" ControlsY="155&#xD;&#xA;" ControlsAlign="center" TooltipHeight="30" TooltipColor="0x222222" TooltipTextY="5" TooltipTextStyle="P-Italic" TooltipTextColor="0xf8f8f8" TooltipMarginLeft="5" TooltipMarginRight="7" TooltipTextSharpness="50" TooltipTextThickness="-100" InfoWidth="400" InfoBackground="0x000099" InfoBackgroundAlpha="0.95" InfoMargin="15" InfoSharpness="0" InfoThickness="0" Autoplay="2" FieldOfView="45"></Settings>
  <Transitions>
    <Transition Pieces="9" Time="1.2" Transition="easeInOutBack" Delay="0.1" DepthOffset="300" CubeDistance="30"></Transition>
    <Transition Pieces="15" Time="3" Transition="easeInOutElastic" Delay="0.03" DepthOffset="200" CubeDistance="10"></Transition>
    <Transition Pieces="5" Time="1.3" Transition="easeInOutCubic" Delay="0.1" DepthOffset="500" CubeDistance="50"></Transition>
    <Transition Pieces="9" Time="1.25" Transition="easeInOutBack" Delay="0.1" DepthOffset="900" CubeDistance="5"></Transition>
  </Transitions>
</Piecemaker>


