window.onload = function() {
    window.addEventListener("resize", () => {
        // console.log(window.innerWidth);
        let width = window.innerWidth;

        if (width > 425) {
            document.getElementById("m-nav").style.display = "none";
        }
    });


    $(".ham-box").click(() => {
        $("#m-nav").toggle();
    });
};