package com.sc.mytown.util;

public class PaginateUtil {
   public static String paginate(int now, int total, int numPage, int numBlock, String url, String param) {
      // now : 현재페이지
      // total : 전체게시물수
      // numPage : 한 페이지당 보여질 게시물 수
      // numBlock : 한 페이지에 보여질 페이징 블록의 갯수
      // url : 주소
      // param : 파라미터
      
      int totalPage = (int)Math.ceil((double)total/numPage); // 전체 페이지 수
      int nowBlock = (int)Math.ceil((double)now/numBlock); // 현재 블록
      String paging = "";
      
      if(total > 0){
         paging += "<div class='paging'>";
         
         // 이전 버튼
         if(now <= 1) {
            paging += "<span title='이전 페이지 없음'><i class='fa fa-chevron-circle-left'></i></span>";
         }else {
            paging += "<a href='"+url+"?"+param+(now-1)+"' class='pageOne arrow' title='"+(now-1)+"페이지'><span class='screen_out'>"+(now-1)+"</span><i class='fa fa-chevron-circle-left'></i></a>";
         }// 이전버튼 end
         
         for(int i = 1;i <= numBlock; i++) {
            // 출력될 실제 페이지
            int realPage = (nowBlock-1)*numBlock+i;
            
            if(realPage == now) {
               // 현재페이지
               paging += "<span title='현재페이지' class='now_page'>"+now+"</span>";
            }else {
               // 현재페이지가 아닐때
               paging += "<a href='"+url+"?"+param+realPage+"' class='pageOne' title='"+realPage+" 페이지'>"+realPage+"</a>";
            }// if~else end
            
            // 현재페이지와 마지막페이지가 같으면 break;
            if(realPage == totalPage) {
               break;
            }
            
         } // for end
         
         // 다음 버튼
         if(now >= totalPage) {
            paging += "<span  title='다음 페이지 없음'><i class='fa fa-chevron-circle-right'></i></span>";
         }else {
            paging += "<a href='"+url+"?"+param+(now+1)+"' class='pageOne arrow' title='"+(now+1)+"페이지'><span class='screen_out'>"+(now+1)+"</span><i class='fa fa-chevron-circle-right'></i></a>";
         } // 다음버튼 end
         
         paging += "</div>";
      }
      
      return paging;
   }
}