<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon.ico 로그인 시 콘솔창에 뜨는 거 제거 -->
<link rel="icon" href="data:,">
<link rel="shortcut icon" type="image/x-icon" href="/images/logo.png">
<title>Resellium | 리셀리움</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css" />
<script type="text/javascript" src="/resources/js/Winwheel.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
        
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

   *{ box-sizing:border-box; }

   body, html { margin:0; padding:0;}
   
   body {
      width:100vw;
      height:100vh;
      background-image: url('/resources/roulette/test1.gif');
      background-size: cover;
      background-position:center;
      display:flex;
      justify-content:center;
      align-items:center;
   }
   
   #logo { position:fixed; top:20px; left:30px; text-decoration:none; }
   #logo:hover { text-decoration:none; }
   
   #test:hover {
      background-color:black;
      color:white;
   }
   
   
   .swal2-popup {
        font-size: 20px !important;
   }
   
</style>
</head>
<body>

      <a href="/" id="logo" style="font-style:italic; font-size:2.3rem; font-weight:bold; color:#bebebe;">
      Resellium
      </a>
      

      <div align="center" id="roulette" style="display:flex; justify-content:center; align-items:center;">
         <br><br><br><br><br><br><br>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="438" height="582" class="the_wheel" align="center" valign="center" style="position:relative;">
                        <canvas id="canvas" width="434" height="434">
                            <p style="{color: white}" align="center">Sorry, your browser doesn't support canvas. Please try another.</p>
                        </canvas>
                        <span class="clickable" id="spin_button" alt="Spin" onclick="startSpin();" style="position:absolute; z-index:100; top:243px; left:161px; margin-left:14px; padding-top:19px; padding-left:2px; background-color:white; color:black; width:90px; height:90px; font-size:1.7rem; font-weight:bold; border:3px solid black; border-radius:50%;">Spin!</span>
                    </td>
                </tr>
            </table>
            <table>
               <tr>
                   <td>
                      <br><br>
<!--                         <span class="clickable" id="spin_button" alt="Spin" onclick="startSpin();" style="margin-left:14px; padding:5px 70px 15px 70px; background-color:white; color:black; width:200px; font-size:3.5rem; font-weight:bold; border-radius:15px;">Spin!</span> -->
                    </td>
                </tr>
            </table>
        </div>
        
        
        
        <script>
        
	        Swal.fire({
		      	  title: '리셀리움 이벤트!',
		      	  text: '스핀 버튼을 눌러 룰렛을 돌려보세요!',
		      	  imageUrl: '/roulette/event.jpg',
		      	  imageWidth: 400,
		      	  imageHeight: 460,
		      	  imageAlt: 'Custom image',
		      	  width: 500,
		      	  backdrop : false
		      	})
        
           let isWheelSpinning = 0
        
           $("#spin_button").on("mouseover", function(){
              if(isWheelSpinning == 0) {
                 $(this).css({"background-color" : "black", "color" : "white"})
              }
           })
           
           $("#spin_button").on("mouseleave", function(){
              if(isWheelSpinning == 0) {
                 $(this).css({"background-color" : "white", "color" : "black"})
              }
           })
        
            // Create new wheel object specifying the parameters at creation time.
            let theWheel = new Winwheel({
                'numSegments'  : 8,     // Specify number of segments.
                'outerRadius'  : 213,   // Set outer radius so wheel fits inside the background.
                'textFontSize' : 21,    // Set font size as desired.
                'segments'     :        // Define segments including colour and text.
                [
                   {'fillStyle' : 'black', 'text' : '       새콤달콤', 'size' : winwheelPercentToDegrees(8.3335)},
                   {'fillStyle' : '#34a853', 'text' : '   꽝', 'textFontSize' : 30, 'size' : winwheelPercentToDegrees(16.6665)},
                   {'fillStyle' : 'black', 'text' : '       1000 포인트', 'size' : winwheelPercentToDegrees(8.3325)},
                   {'fillStyle' : '#4286f5', 'text' : '   꽝', 'textFontSize' : 30,  'size' : winwheelPercentToDegrees(16.6675)},
                   {'fillStyle' : 'black', 'text' : '       무료배송 쿠폰', 'size' : winwheelPercentToDegrees(8.3325)},
                   {'fillStyle' : '#fcbc02', 'text' : '   꽝', 'textFontSize' : 30,  'size' : winwheelPercentToDegrees(16.6675)},
                   {'fillStyle' : 'black', 'text' : '       니베아 립밤', 'size' : winwheelPercentToDegrees(8.3325)},
                   {'fillStyle' : '#ea4235', 'text' : '   꽝', 'textFontSize' : 30,  'size' : winwheelPercentToDegrees(16.6675)},
                ],
                'animation' :           // Specify the animation to use.
                {
                    'type'     : 'spinToStop',
                    'duration' : 7,
                    'spins'    : 12,
                    'callbackFinished' : alertPrize,
                    'callbackSound'    : playSound,   // Function to call when the tick sound is to be triggered.
                    'soundTrigger'     : 'pin'        // Specify pins are to trigger the sound, the other option is 'segment'.
                },
                'pins' :
                {
                    'number' : 12  // Number of pins. They space evenly around the wheel.
                }
            });
            
            // 폰트 컬러
            theWheel.segments[1].textFillStyle = 'white';
            theWheel.segments[2].textFillStyle = 'white';
            theWheel.segments[3].textFillStyle = 'white';
            theWheel.segments[4].textFillStyle = 'white';
            theWheel.segments[5].textFillStyle = 'white';
            theWheel.segments[6].textFillStyle = 'white';
            theWheel.segments[7].textFillStyle = 'white';
            theWheel.segments[8].textFillStyle = 'white';
            
            theWheel.draw();

            // -----------------------------------------------------------------
            // This function is called when the segment under the prize pointer changes
            // we can play a small tick sound here like you would expect on real prizewheels.
            // -----------------------------------------------------------------
            let audio = new Audio('/resources/roulette/tick.mp3');  // Create audio object and load tick.mp3 file.

            function playSound()
            {
                // Stop and rewind the sound if it already happens to be playing.
                audio.pause();
                audio.currentTime = 0;

                // Play the sound.
                audio.play();
            }

            // -------------------------------------------------------
            // Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
            // note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
            // -------------------------------------------------------
            function alertPrize(indicatedSegment) {
                
                if(indicatedSegment.text == "   꽝") {
                   Swal.fire({
                   title : "꽝!",
                   text : "다음기회에...",
                   icon : "warning",
                   backdrop : false
                }).then(function(){
                
                     document.getElementById('spin_button').className = "clickable";
                      theWheel.stopAnimation(false);
                      theWheel.rotationAngle = 0;
                      theWheel.draw();
      
                      wheelSpinning = false;
                      
                      $("#spin_button").css("background-image", "")
                      $("#spin_button").text("Spin!")
                      $("#spin_button").css({"background-color" : "white", "color" : "black"})
                      isWheelSpinning = 0
                })
               } else if(indicatedSegment.text == "       새콤달콤") {
                  Swal.fire({
                    title : "<br><br><br><br><br><br><br><br><br><br>",
                    text : "새콤달콤 당첨! 축하합니다!",
//                     icon : "success",
                    color : "white",
                    width : 1200,
                    background: "url(/resources/roulette/congratulations.gif) center no-repeat",
                    backdrop : false
                 }).then(function(){
                
                     document.getElementById('spin_button').className = "clickable";
                      theWheel.stopAnimation(false);
                      theWheel.rotationAngle = 0;
                      theWheel.draw();
      
                      wheelSpinning = false;
                      
                      $("#spin_button").css("background-image", "")
                      $("#spin_button").text("Spin!")
                      $("#spin_button").css({"background-color" : "white", "color" : "black"})
                      isWheelSpinning = 0
                })
               } else if(indicatedSegment.text == "       1000 포인트") {
                  Swal.fire({
                    title : "<br><br><br><br><br><br><br><br><br><br>",
                    text : "1000 포인트 당첨! 축하합니다!",
//                     icon : "success",
                    color : "white",
                    width : 1200,
                    background: "url(/resources/roulette/congratulations.gif) center no-repeat",
                    backdrop : false
                 }).then(function(){
                
                     document.getElementById('spin_button').className = "clickable";
                      theWheel.stopAnimation(false);
                      theWheel.rotationAngle = 0;
                      theWheel.draw();
      
                      wheelSpinning = false;
                      
                      $("#spin_button").css("background-image", "")
                      $("#spin_button").text("Spin!")
                      $("#spin_button").css({"background-color" : "white", "color" : "black"})
                      isWheelSpinning = 0
                })
               } else if(indicatedSegment.text == "       무료배송 쿠폰") {
                  Swal.fire({
                    title : "<br><br><br><br><br><br><br><br><br><br>",
                    text : "무료배송 쿠폰 당첨! 축하합니다!",
//                     icon : "success",
                    color : "white",
                    width : 1200,
                    background: "url(/resources/roulette/congratulations.gif) center no-repeat",
                    backdrop : false
                 }).then(function(){
                
                     document.getElementById('spin_button').className = "clickable";
                      theWheel.stopAnimation(false);
                      theWheel.rotationAngle = 0;
                      theWheel.draw();
      
                      wheelSpinning = false;
                      
                      $("#spin_button").css("background-image", "")
                      $("#spin_button").text("Spin!")
                      $("#spin_button").css({"background-color" : "white", "color" : "black"})
                      isWheelSpinning = 0
                })
               } else if(indicatedSegment.text == "       니베아 립밤") {
                  Swal.fire({
                    title : "<br><br><br><br><br><br><br><br><br><br>",
                    text : "니베아 립밤 당첨! 축하합니다!",
//                     icon : "success",
                    color : "white",
                    width : 1200,
                    background: "url(/resources/roulette/congratulations.gif) center no-repeat",
                    backdrop : false
                 }).then(function(){
                
                     document.getElementById('spin_button').className = "clickable";
                      theWheel.stopAnimation(false);
                      theWheel.rotationAngle = 0;
                      theWheel.draw();
      
                      wheelSpinning = false;
                      
                      $("#spin_button").css("background-image", "")
                      $("#spin_button").text("Spin!")
                      $("#spin_button").css({"background-color" : "white", "color" : "black"})
                      isWheelSpinning = 0
                })
               }
                
            }

            // =======================================================================================================================
            // Code below for the power controls etc which is entirely optional. You can spin the wheel simply by
            // calling theWheel.startAnimation();
            // =======================================================================================================================
            let wheelPower    = 0;
            let wheelSpinning = false;

            // -------------------------------------------------------
            // Function to handle the onClick on the power buttons.
            // -------------------------------------------------------
            function powerSelected(powerLevel)
            {
                // Ensure that power can't be changed while wheel is spinning.
                if (wheelSpinning == false) {
                    // Reset all to grey incase this is not the first time the user has selected the power.
                    document.getElementById('pw1').className = "";
                    document.getElementById('pw2').className = "";
                    document.getElementById('pw3').className = "";

                    // Now light up all cells below-and-including the one selected by changing the class.
                    if (powerLevel >= 1) {
                        document.getElementById('pw1').className = "pw1";
                    }

                    if (powerLevel >= 2) {
                        document.getElementById('pw2').className = "pw2";
                    }

                    if (powerLevel >= 3) {
                        document.getElementById('pw3').className = "pw3";
                    }

                    // Set wheelPower var used when spin button is clicked.
                    wheelPower = powerLevel;

                    // Light up the spin button by changing it's source image and adding a clickable class to it.
                    document.getElementById('spin_button').src = "/resources/roulette/spin_on.png";
                    document.getElementById('spin_button').className = "clickable";
                }
            }

            // -------------------------------------------------------
            // Click handler for spin button.
            // -------------------------------------------------------
            function startSpin()
            {
                // Ensure that spinning can't be clicked again while already running.
                if (wheelSpinning == false) {
                    // Based on the power level selected adjust the number of spins for the wheel, the more times is has
                    // to rotate with the duration of the animation the quicker the wheel spins.
//                     if (wheelPower == 1) {
//                         theWheel.animation.spins = 3;
//                     } else if (wheelPower == 2) {
//                         theWheel.animation.spins = 8;
//                     } else if (wheelPower == 3) {
//                         theWheel.animation.spins = 15;
//                     }

                    // Disable the spin button so can't click again while wheel is spinning.
//                     document.getElementById('spin_button').src       = "/resources/roulette/spin_off.png";
                    
                    isWheelSpinning = 1
                    
                    $("#spin_button").css("background-color", "grey")
                    $("#spin_button").text("")
               $("#spin_button").css("background-image", "url('/resources/roulette/dancing.gif')")
               $("#spin_button").css("background-size", "cover")
               $("#spin_button").css("background-position", "center")
                    document.getElementById('spin_button').className = "";

                    // Begin the spin animation by calling startAnimation on the wheel object.
                    theWheel.startAnimation();

                    // Set to true so that power can't be changed and spin button re-enabled during
                    // the current animation. The user will have to reset before spinning again.
                    wheelSpinning = true;
                }
            }

            // -------------------------------------------------------
            // Function for reset button.
            // -------------------------------------------------------
            function resetWheel()
            {
//                document.getElementById('spin_button').src       = "/resources/roulette/spin_on.png";
//             $("#spin_button").css("background-color", "white")
//                document.getElementById('spin_button').className = "clickable";
//                 theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
//                 theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
//                 theWheel.draw();                // Call draw to render changes to the wheel.

//                 wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
            }
        </script>

</body>
</html>