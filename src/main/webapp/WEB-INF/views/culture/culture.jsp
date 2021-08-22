<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="body-contents-wrapper">
	<div class="title-wrapper">
		<h2>culture</h2>
	</div>
	<div class="culture-wrapper">
		<div class="culture_tap">
			<ul class="tap-area">
				<li class="tap">
					<span>독서</span>
				</li>
				<li class="tap">
					<span>영화</span>
				</li>
			</ul>
		</div>
		<div class="culture-contents-wrapper">
			<div class="book_contents" style="display:none;">
				<div class="book-item">
					<div class="book-title">페스트</div>
					<div class="book-summary">알베르 카뮈의 고전 장편소설</div>
				</div>
				<div class="book-item">
					<div class="book-title">데미안</div>
					<div class="book-summary">헤르만헤세의 고전 장편소설</div>
				</div>
			</div>
			<div class="movie_contents" style="display:none;">
				<div class="movie-item">
					<div class="movie-title">행복을위하여</div>
					<div class="movie-summary">재미있는영화</div>
				</div>
				<div class="movie-item">
					<div class="movie-title">피아니스트</div>
					<div class="movie-summary">슬픈영화</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(".tap").click(function(){
		var idx = $(".tap").index(this);
		if(idx == 0 )
			{
				$(".book_contents").show();
				$(".movie_contents").hide();
			}
		else
			{
				$(".movie_contents").show();
				$(".book_contents").hide();
			}
	})
</script>