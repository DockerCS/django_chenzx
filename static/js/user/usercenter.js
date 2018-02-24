$(function(){
		/*模拟下拉菜单js时*/
		$(".time_list").mouseleave(function(){
			$(this).css({display:"none"})
			})
		$(".qjwxlk").on("mouseenter", function(e){
					if($(".time_list").is(":hidden")){
						$(".time_list").show();
					}else{
						$(".time_list").hide();
					}
						$(".time_list em").click(function(){
							var txt=$(this).text();
							$(".qjwxlk").text(txt);
							$(".time_list").hide();
						})
						$(document).one("click", function(){
							$(".time_list").hide();
						});
							e.stopPropagation();
					});
						$(".time_list").on("click", function(e){
						e.stopPropagation();
				});
		/*模拟下拉菜单js时*/
		$(".time_lists").mouseleave(function(){
			$(this).css({display:"none"})
			})
		$(".qjwxlks").on("mouseenter", function(e){
					if($(".time_lists").is(":hidden")){
						$(".time_lists").show();
					}else{
						$(".time_lists").hide();
					}
						$(".time_lists em").click(function(){
							var txt=$(this).text();
							$(".qjwxlks").text(txt);
							$(".time_lists").hide();
						})
						$(document).one("click", function(){
							$(".time_lists").hide();
						});
							e.stopPropagation();
					});
						$(".time_lists").on("click", function(e){
						e.stopPropagation();
				});
	})			
	
		
			
	
		
	