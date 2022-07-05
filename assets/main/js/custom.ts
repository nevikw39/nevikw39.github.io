(function () {
    "use strict";
    new Promise(r => {
        const id = setInterval(() => {
            const disqus = document.getElementById("disqus_thread");
            if (disqus.childElementCount > 0) {
                clearInterval(id);
                r(disqus);
            }
        }, 87);
    }).then(disqus => disqus.children[0].style.display = 'none');
})();