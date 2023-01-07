function getUsers(compus)
{
    var arr = compus == 0 ? ranks : ranksBg;
    Object.keys(arr).forEach(function (rank){
        arr[rank].forEach(function (student)
        {
		var login = student.login;
		var levelwithdecimal = student.level;
		var coalition = student.coalition;
		var level = parseFloat(levelwithdecimal).toFixed(2);
		var row   =
                `
                <div class="container">
                    <div class="row">
                            <div class="rank"> ${rank} </div>
                         
			  ${coalition  == "Freax" ? `<img src="png/freax.png" max-width="20px" height="5%" width="7%" style="margin: 2px 0px"/>` : ""}
			  ${coalition  == "Commodore" && login != "wbousfir" ? `<img src="png/commodore.png" max-width="20px" height="5%" width="7%" style="margin: 2px 0px"/>` : ""}
			  ${coalition  == "Bios" ? `<img src="png/bios.png" max-width="20px" height="5%" width="7%" style="margin: 2px 0px"/>` : ""}
			  ${coalition  == "Pandora" ? `<img src="png/pandora.png" max-width="20px" height="5%" width="7%" style="margin: 2px 0px"/>` : ""}
    <!-- 			${login  == "wbousfir" ? `<img src="png/leetsec_logo.png" max-width="20px" height="11%" width="11%" style="margin: 8px -6px"/>&nbsp;&nbsp;` : ""}
     -->
	
                          
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
    <!-- JQuery CDN -->
  <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
    </script>

    <style>
    div#pop-up {
   display: none;
   position: absolute;
   width: 280px;
   #padding: 10px;
   #background: #eeeeee;
   color: #000000;
   #border: 1px solid ;
   font-size: 90%;
 }
    </style>

    <script>

$(function() {
   var moveLeft = 20;
   var moveDown = 10;

   $('a.trigger').hover(function(e) {
     $('div#pop-up').show();
     //.css('top', e.pageY + moveDown)
     //.css('left', e.pageX + moveLeft)
     //.appendTo('body');
   }, function() {
     $('div#pop-up').hide();
   });

   $('a.trigger').mousemove(function(e) {
     $("div#pop-up").css('top', e.pageY + moveDown).css('left', e.pageX + moveLeft);
   });

 });
   </script>

<body>
		<div class="profile-img">
      <a href="#" class="trigger">
                        <img class="profile-img" src="./photos/medium_${login}.jpg" alt="avatar">
      </a>
</div>


    <div id="pop-up">
       <p>
      <img src="https://badge.mediaplus.ma/darkblue/${login}"\>
    </div>

                            <div class="login" style="
                                display : flex;                            
                            ">
                              <div class="login" ><a href="https://profile.intra.42.fr/users/${login}" style="color: white; text-decoration:none" target="_blank">${login}</a></div>
			${rank  == 1 ? `<p style = "
                              margin : 0px 2px;
                              ">&#128081;</p>` : ""}
                	${login  == "wbousfir" ? `<p style = "
                              margin : 0px 2px;
                              ">&#128373;</p><!--<img src="png/leetsec_logo.png" max-width="20px" height="15%" width="15%" style="margin: 2px 0px"/>-->` : ""}
                         ${login  == "wzakkabi" ? `<p style = "
				margin : -4px 2px;
				">&#128520;</p>` : ""}
			${login  == "ikorchi" ? `<p style = "
				margin : 0px 2px;
				">&#129761;</p>` : ""}

                         
                            </div>
                	<div class="level"><strong>${level}</strong></div>
                    </div>
                </div>
                `
            document.body.insertAdjacentHTML('beforeend',row)
            
        })
        
    })
}
//With help of https://github.com/yassine542 
