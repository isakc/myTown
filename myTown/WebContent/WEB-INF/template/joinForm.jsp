<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="joinBox">
	<div class="bg"></div>
	<div id="joinScroll">
		<form id="joinUpload" action="joinUpload.jsp" method="post" enctype="multipart/form-data"></form>
		<form id="joinDataForm">
		<div id="joinForm">
			<div id="infoForm">
				<h2 class="main_info">필수 정보</h2>
				<div id="userPicture">
					<div class="upload_profile">
						<button class="upload_file"><i class="fa fa-camera"></i></button>
						<input type="file" form="joinUpload" class="profile_upload"/>
					</div>
				</div>
				<!-- //userPicture -->
				<div class="user_info">
					<div class="info">
						<label for="id" class="user_id">아이디(이메일)</label> <input id="id"
							class="user_input" name="id" placeholder="아이디(이메일형식)" />
					</div>
					<div class="info">
						<label for="nickName" class="user_nickname">닉네임</label> <input
							id="nickName" class="user_input" name="nickName"
							placeholder="닉네임" />
						<div class="msg_box"></div>
					</div>
					<div class="info">
						<label for="password" class="user_pwd">비밀번호</label> <input
							type="password" id="password" class="user_input" name="password"
							required pattern="[\w]{4,32}" placeholder="비밀번호" />
						<div class="word"></div>
					</div>
					<div class="info">
						<label for="pwdRight" class="user_pwd_check">비밀번호 확인</label> <input
							type="password" id="pwdRight" class="user_input"
							placeholder="비밀번호 확인" />
						<div class="word"></div>
					</div>
				</div>
				<!-- //userInfo -->
				<div class="address">
					<h2 class="address_info">주소입력</h2>
					<input id="fstZipCode" class="address_input zipcode"
						name="fstZipCode" placeholder="우편번호" />
					<button type="button" class="btn add_btn">우편번호 찾기</button>
					<input id="fstAdd" class="address_input add" name="userAdd"
						placeholder="주소" /> <input id="fstDetailAdd"
						class="address_input add detail_add" name="userDetailAdd"
						placeholder="상세주소" /> <input type="hidden" name="mainGu" value="" />
					<input type="hidden" name="mainDong" value="" />
				</div>
				<!-- //address -->
			</div>
			<!-- //infoForm -->
			<div class="preferred">
				<h2 class="preferred_info">선호유형</h2>
				<table class="info">
					<tr class="screen_out">
						<th>1차 카테고리</th>
						<th>2차 카테고리</th>
					</tr>
					<tr>
						<td class="td">
							<h3 class="fst_category">Food Town</h3>
						</td>
						<td class="sec_category">
							<ul class="sec_category_list">
								<li><input type="checkbox" id="koreaFood" name="foodTown" />
									<label for="koreaFood">한식</label></li>
								<li><input type="checkbox" id="japanFood" name="foodTown" />
									<label for="japanFood">일식</label></li>
								<li><input type="checkbox" id="chinaFood" name="foodTown" />
									<label for="chinaFood">중식</label></li>
								<li><input type="checkbox" id="asiaFood" name="foodTown" />
									<label for="asiaFood">아시아퓨전</label></li>
								<li><input type="checkbox" id="westernFood" name="foodTown" />
									<label for="westernFood">서양음식</label></li>
								<li><input type="checkbox" id="fastFood" name="foodTown" />
									<label for="fastFood">패스트 푸드</label></li>
								<li><input type="checkbox" id="familyRst" name="foodTown" />
									<label for="familyRst">패밀리 레스토랑</label></li>
								<li><input type="checkbox" id="snackBar" name="foodTown" />
									<label for="snackBar">분식</label></li>
								<li><input type="checkbox" id="pizza" name="foodTown" /> <label
									for="pizza">피자</label></li>
								<li><input type="checkbox" id="chicken" name="foodTown" />
									<label for="chicken">치킨</label></li>
								<li><input type="checkbox" id="pub" name="foodTown" /> <label
									for="pub">주점</label></li>
								<li><input type="checkbox" id="etc" name="foodTown" /> <label
									for="etc">기타</label></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="td border_bottom_clean">
							<h3 class="fst_category">Play Town</h3>
						</td>
						<td class="sec_category border_bottom_clean">
							<ul>
								<li><input type="checkbox" id="nightView" name="playTown" />
									<label for="nightView">야경</label></li>
								<li><input type="checkbox" id="shopping" name="playTown" />
									<label for="shopping">쇼핑</label></li>
								<li><input type="checkbox" id="festival" name="playTown" />
									<label for="festival">축제</label></li>
								<li><input type="checkbox" id="arcade" name="playTown" />
									<label for="arcade">오락</label></li>
								<li><input type="checkbox" id="sauna" name="playTown" /> <label
									for="sauna">찜질방</label></li>
								<li><input type="checkbox" id="leisure"
									name="leiplayTownsure" /> <label for="leisure">레저</label></li>
								<li><input type="checkbox" id="park" name="playTown" /> <label
									for="park">산책로(공원)</label></li>
								<li><input type="checkbox" id="theater" name="playTown" />
									<label for="theater">극장</label></li>
								<li><input type="checkbox" id="ammPark" name="playTown" />
									<label for="ammPark">놀이공원</label></li>
								<li><input type="checkbox" id="themaCafe" name="playTown" />
									<label for="themaCafe">테마카페</label></li>
								<li><input type="checkbox" id="sports" name="playTown" />
									<label for="sports">스포츠</label></li>
								<li><input type="checkbox" id="traditionalMarket"
									name="playTown" /> <label for="traditionalMarket">재래시장</label>
								</li>
								<li><input type="checkbox" id="museum" name="playTown" />
									<label for="museum">미술관/박물관</label></li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
			<!-- //preferred -->
			<h2 class="add_data">추가 정보</h2>
			<div class="add_info">
				<table class="info">
					<tr class="screen_out">
						<th>구분</th>
						<th>내용</th>
					</tr>
					<tr>
						<td class="td">
							<h3 class="line_height">성별</h3>
						</td>
						<td class="td value"><input type="radio" id="genderF"
							class="info input" name="gender" value="M" /> <label
							for="genderF" class="info">여자</label> <input type="radio"
							id="genderM" class="info input" name="gender" value="F" /> <label
							for="genderM" class="info">남자</label></td>
					</tr>
					<tr class="addInfo tr">
						<td class="td">
							<h3 class="line_height">생년월일</h3>
						</td>
						<td class="td value"><select id="year" class="infoInput info"
							name="birth">
								<option value="2000" selected>2000</option>
								<option value="2001">2001</option>
								<option value="2002">2002</option>
								<option value="2003">2003</option>
						</select><em>년</em> <select id="month" class="infoInput info" name="birth">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
						</select><em>년</em> <select id="day" class="infoInput info" name="birth">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
						</select><em>년</em></td>
					</tr>
					<tr>
						<td class="td">
							<h3 class="line_height">직업</h3>
						</td>
						<td class="td value"><select id="job" class="infoInput info"
							name="job">
								<option value="student" selected>학생</option>
								<option value="worker">직장인</option>
								<option value="jobless">무직</option>
								<option value="etc">기타</option>
						</select></td>
					</tr>
					<tr class="address">
						<td class="td border_bottom_clean">
							<h3 class="line_height">제 2의 활동지</h3>
						</td>
						<td class="value border_bottom_clean"><input id="secZipCode"
							class="address_input zipcode" placeholder="우편번호"
							name="secZipCode" />
							<button type="button" class="btn add_btn">우편번호 찾기</button> <input
							id="secAdd" placeholder="주소 " class="address_input add"
							name="secAdd" /> <input id="secDetailAdd" placeholder="상세주소"
							class="address_input add detail_add" name="secDetailAdd" /></td>
					</tr>
				</table>
			</div><!-- //addInfo -->
		</form>
		</div><!-- //joinForm -->
		<div id="insertBtn">
			<button class="insert_btn btn">가입하기</button>
			<button class="join_cancel_btn btn">취소</button>
		</div><!-- //insertBtn -->
	</div><!-- //joinScroll -->
	

</div>
<!-- #joinBox -->