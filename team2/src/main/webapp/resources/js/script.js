function keyword_check() {
    if (document.search.keyword.value == '') { //검색어가 없을 경우  
        alert('검색어를 입력하세요'); //경고창 띄움 
        document.search.keyword.focus(); //다시 검색창으로 돌아감 
        return false;
    } else
        document.search.submit();
}