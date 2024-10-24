window.onload = function () {
};

function writeBoard() {
    location.href = "/vs_write.do";
}


function selBoard(seq) {
    location.href = "/vs_info.do?vs_no=" + seq;
}

function BoardIndex(){
	location.href = "/vs_index.do";
}

function updateBoard(seq){
    location.href="/vs_update.do?vs_no=" + seq;
}