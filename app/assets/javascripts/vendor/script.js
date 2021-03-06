
function bind() {
    $(".pp").on('click', function (e) {
        changephoto($(this));
        e.stopPropagation();
    });

    function changephoto(e)
    {
        var pp = e;
        var max = -($(".pp").length * pp.width() - pp.width()*10);
        showPhoto(pp.next());
        var nowindex = $('.active').attr('data-index');
        var z =-nowindex * pp.width() + pp.width()*6;
        var f2 = pp.parents('ul');
        if(z>0)
        {
            z=0;
        }
        if(z<max)
        {
            z=max;
        }

        f2.animate({left: z}, 100);
    }

    function showPhoto(e) {
        var src = e.attr('data-imgsrc')
        var p = $(".showphotos .photo").find(".p");
        p.html('<img src="' + src + '">');
        var id = e.attr('data-photoid');
        setactive(id);
        $.ajax({
            url: "comments/photocomments",
            type: 'post',
            data: {photo_id: id},
            success: function (data) {
                $(".showphotos .comments").html(data);
            },
            dataType: 'html'
        });
    }

    $('.photo').mousemove(function (event) {
        var offset, p, x;
        offset = $(this).offset();
        x = event.pageX - offset.left;
        p = $(this).children('.p');
        if (x < 400) {
            p.addClass('left');
            p.removeClass('right');
        } else if (x > 400) {
            p.addClass('right');
            p.removeClass('left');
        }
        $(".setbookcover").css("display",'block');
    });
    $('.photo').mouseout(function (event) {

       var p= $(this).children('.p');
        p.removeClass('left');
        p.removeClass('right');
        $(".setbookcover").css("display",'none');
    });
    $(".setbookcover").on('click',function(e){


        var cover = $(".active").next().attr("data-cover");
        $.ajax({
            url: "photobooks/setbookcover",
            type: 'post',
            data: {bookcover: cover,id:$("#photobookid").val()},
            success: function () {
               alert("设置成功");
            }
        });
        e.stopPropagation();
    });

    var prev, next;
    prev = function () {
        var p = $(".active").parent();
        var pp = p.prev().find('.pp');
        if(pp.length)
         changephoto(pp);
    };
    next = function () {

        var p = $(".active").parent();
        var pn = p.next().find('.pp');
        if(pn.length)
        changephoto(pn);

    };
    $('.p').on('click',function (event) {
        var offset, x;
        offset = $(this).offset();
        x = event.pageX - offset.left;
        if (x < 400) {
            prev();
        } else if (x > 400) {
            next();
        }
    });
}
function setactive(pid){
    $(".pp").removeClass("active");
    $(".ppp img[data-photoid='"+pid+"']").prev().addClass("active");
}
