{if isset($AVATARCHOICES)}
<script>
$(document).ready(function () {

                    
$('.popoverOption').popover({ trigger: "hover",html:"true"});

var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

var default_img = new Image();
default_img.src = "{if !isset($SHOWPROFILE)}../{/if}../img/default.png";
default_img.onload = function() {
    ctx.drawImage(default_img, 0, 0);
};

{IF $AVATARCHOICES.part0 != NULL}
var part0 = new Image();
part0.src = "{if !isset($SHOWPROFILE)}../{/if}../img/{$AVATARCHOICES.ipart0}";
part0.onload = function() {
    ctx.drawImage(part0, 0, 0);
};
{/if}

{IF $AVATARCHOICES.part1 != NULL}
var part1 = new Image();
part1.src = "{if !isset($SHOWPROFILE)}../{/if}../img/{$AVATARCHOICES.ipart1}";
part1.onload = function() {
    ctx.drawImage(part1,  50, 110);
};
{/if}

{IF $AVATARCHOICES.part2 != NULL}
var part2 = new Image();
part2.src = "{if !isset($SHOWPROFILE)}../{/if}../img/{$AVATARCHOICES.ipart2}";
part2.onload = function() {
    ctx.drawImage(part2,  50, 25);
};

{/if}
});
</script>
<canvas style="padding-left: 0;    padding-right: 0;    margin-left: auto;    margin-right: auto;    display: block;" width="200" height="300" id="canvas"></canvas>
{/if}