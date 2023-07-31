
$(function(){

	$('#gnb > ul > li').mouseover(function(){
		$(this).addClass('on');
		$(this).siblings('li').removeClass('on')
	});

	$('.wrap_layerpop .btn_close').click(function(){
		$('.wrap_layerpop').hide();
	});

	$('.wrap_layerpop2 .btn_close').click(function(){
		$('.wrap_layerpop2').hide();
	});

	clickev();
	inputFile();
});

function clickev(){
	$('.box_lay .list_lay li').click(function(){
		$(this).addClass('on');
		$(this).siblings('li').removeClass('on');
	});

	$('.lnb .tablist li').click(function(){
		var chknum = $(this).attr('class');
		var chkitem = chknum.substr(2,1);
		console.log(chkitem);

		if(chkitem == 1){
			$('.lnb .dt_list').show();
			$('.lnb .dt_list2').hide();
		}
		else if(chkitem == 2){
			$('.lnb .dt_list2').show();
			$('.lnb .dt_list').hide();
		}
	});

	$('.bx_chk_list li button').click(function(){
		$(this).toggleClass('on');
	});

	$('.lnb .dt_list li .btn_x').click(function(){
		$(this).parent().parent('li').remove();
	});

	$('.wrap_key .key_lft .btn_btm').click(function(){
		$('.wrap_key .key_lft ul li:first-child').animate({"margin-top":"-=412px"},"500");
	});

	$('.wrap_key .key_lft li').click(function(){
		$(this).addClass('on');
		$(this).siblings('li').removeClass('on');
	});


}

//input file
function inputFile(){
	var fileTarget = $('.file_inp .hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }

        $(this).siblings('.uploadfile').val(filename);
    });
}
