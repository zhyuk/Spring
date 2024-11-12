
        
function confirmTaltae() {
    if (confirm("정말 탈퇴 하시겠습니까?")) {
    	
        const form = document.createElement("form");
        form.method = "POST";
        form.action = "taltaeUser.do"; 

        document.body.appendChild(form);
        form.submit();
    }
}