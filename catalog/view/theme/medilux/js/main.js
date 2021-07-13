$(window).on('load', function() {
    $preloader = $('.loaderArea'),
        $loader = $preloader.find('.loader');
    $loader.fadeOut();
    $preloader.delay(350).fadeOut('slow');
});

$(document).ready(function() {
    $(function() {
        var Accordion = function(el, multiple) {
            this.el = el || {};
            this.multiple = multiple || false;

            // Variables privadas
            var links = this.el.find('.link');
            // Evento
            links.on('click', { el: this.el, multiple: this.multiple }, this.dropdown)
            $('.link').click(function(e) {
                e.preventDefault();
                $(this).find('.arrow-menu').toggleClass('active');
            });
        }

        Accordion.prototype.dropdown = function(e) {
            var $el = e.data.el;
            $this = $(this),
                $next = $this.next();

            $next.slideToggle();
            $this.parent().toggleClass('open');

            if (!e.data.multiple) {
                $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
            };
        }

        var accordion = new Accordion($('#accordion'), false);

    });


    $(".main__banner").slick({
        dots: true,
        infinite: true,
        speed: 300,
        slidesToShow: 1,
        adaptiveHeight: true,
        arrows: true,
        autoplay: true,
        cssEase: 'linear',
        autoplaySpeed: 2000,
        prevArrow: '<svg class="slick-arrow slick-arrow-prev" width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg"> <circle r="21" transform="matrix(-1 0 0 1 21 21)" fill="#FAFAFA"/> <g clip-path="url(#clip3)"> <path d="M16.3442 20.5061L24.6697 12.2036C24.9425 11.9317 25.3841 11.9321 25.6565 12.205C25.9286 12.4777 25.9279 12.9196 25.655 13.1917L17.8251 21L25.6553 28.8083C25.9281 29.0805 25.9288 29.522 25.6567 29.7949C25.5202 29.9316 25.3414 30 25.1625 30C24.9842 30 24.806 29.9321 24.6698 29.7963L16.3442 21.494C16.2128 21.3633 16.1391 21.1854 16.1391 21C16.1391 20.8147 16.213 20.637 16.3442 20.5061Z" fill="#393185"/>  </g>   <defs>  <clipPath id="clip3"> <rect width="18" height="18" fill="white" transform="matrix(-1 0 0 1 30 12)"/>  </clipPath> </defs></svg>',
        nextArrow: '<svg class="slick-arrow slick-arrow-next" width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="21" cy="21" r="21" fill="#FAFAFA"/><g clip-path="url(#clip3)"><path d="M25.6558 20.5061L17.3303 12.2036C17.0575 11.9317 16.6159 11.9321 16.3435 12.205C16.0714 12.4777 16.0721 12.9196 16.345 13.1917L24.1749 21L16.3447 28.8083C16.0719 29.0805 16.0712 29.522 16.3433 29.7949C16.4798 29.9316 16.6586 30 16.8375 30C17.0158 30 17.194 29.9321 17.3302 29.7963L25.6558 21.494C25.7872 21.3633 25.8609 21.1854 25.8609 21C25.8609 20.8147 25.787 20.637 25.6558 20.5061Z" fill="#393185"/> </g><defs><clipPath id="clip3"><rect width="18" height="18" fill="white" transform="translate(12 12)"/></clipPath></defs></svg>',
        responsive: [{
                breakpoint: 470,
                settings: {
                    arrows: false
                }
            }

        ]
    });

    $(".brands-slick").slick({
        dots: false,
        infinite: true,
        arrows: true,
        slidesToShow: 6,
        cssEase: 'linear',
        autoplaySpeed: 0,
        prevArrow: '<svg width="7" class="slick-arrow slick-arrow-prev" height="11" viewBox="0 0 7 11" fill="none" xmlns="https://www.w3.org/2000/svg"><path d="M0.65491 5.19814L5.74273 0.124392C5.90943 -0.0417463 6.17932 -0.041467 6.34573 0.125251C6.51202 0.291948 6.51159 0.561984 6.34487 0.728251L1.55989 5.50002L6.34505 10.2718C6.51174 10.4381 6.51217 10.7079 6.3459 10.8746C6.26248 10.9582 6.15319 11 6.0439 11C5.93489 11 5.82603 10.9585 5.74275 10.8755L0.65491 5.80187C0.574623 5.72199 0.52957 5.61328 0.52957 5.50002C0.52957 5.38675 0.574751 5.27817 0.65491 5.19814Z" fill="#393185"/></svg>',
        nextArrow: '<svg width="7" class="slick-arrow slick-arrow-next" height="11" viewBox="0 0 7 11" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M6.34509 5.19814L1.25727 0.124392C1.09057 -0.0417463 0.820684 -0.041467 0.654267 0.125251C0.487979 0.291948 0.488408 0.561984 0.655127 0.728251L5.44011 5.50002L0.654955 10.2718C0.488258 10.4381 0.487828 10.7079 0.654095 10.8746C0.737519 10.9582 0.846809 11 0.9561 11C1.06511 11 1.17397 10.9585 1.25725 10.8755L6.34509 5.80187C6.42538 5.72199 6.47043 5.61328 6.47043 5.50002C6.47043 5.38675 6.42525 5.27817 6.34509 5.19814Z" fill="#393185"/></svg>',
        responsive: [{
                breakpoint: 1400,
                settings: {
                    slidesToShow: 4
                }
            }, {
                breakpoint: 770,
                settings: {
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 450,
                settings: {
                    slidesToShow: 2
                }
            },

        ]
    });
    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: false,
        autoplay: true,
        autoplaySpeed: 5000,
        asNavFor: '.slider-nav',
        prevArrow: '<svg width="7" class="slick-arrow slick-arrow-prev" height="11" viewBox="0 0 7 11" fill="none" xmlns="https://www.w3.org/2000/svg"><path d="M0.65491 5.19814L5.74273 0.124392C5.90943 -0.0417463 6.17932 -0.041467 6.34573 0.125251C6.51202 0.291948 6.51159 0.561984 6.34487 0.728251L1.55989 5.50002L6.34505 10.2718C6.51174 10.4381 6.51217 10.7079 6.3459 10.8746C6.26248 10.9582 6.15319 11 6.0439 11C5.93489 11 5.82603 10.9585 5.74275 10.8755L0.65491 5.80187C0.574623 5.72199 0.52957 5.61328 0.52957 5.50002C0.52957 5.38675 0.574751 5.27817 0.65491 5.19814Z" fill="#393185"/></svg>',
        nextArrow: '<svg width="7" class="slick-arrow slick-arrow-next" height="11" viewBox="0 0 7 11" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M6.34509 5.19814L1.25727 0.124392C1.09057 -0.0417463 0.820684 -0.041467 0.654267 0.125251C0.487979 0.291948 0.488408 0.561984 0.655127 0.728251L5.44011 5.50002L0.654955 10.2718C0.488258 10.4381 0.487828 10.7079 0.654095 10.8746C0.737519 10.9582 0.846809 11 0.9561 11C1.06511 11 1.17397 10.9585 1.25725 10.8755L6.34509 5.80187C6.42538 5.72199 6.47043 5.61328 6.47043 5.50002C6.47043 5.38675 6.42525 5.27817 6.34509 5.19814Z" fill="#393185"/></svg>',
    });
    $('.slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        arrows: false,
        vertical: true,
        verticalSwiping: true,
        focusOnSelect: true,
        autoplay: true,
        autoplaySpeed: 5000,
    });
    $('.mobile__button').click(function() {

        $('.menu').addClass('open');

        $('.menu__mobile-bg').fadeIn('fast', 'swing');
    });
    $('.menu__mobile-bg').click(function() {
        $('.menu').removeClass('open');
        $('.menu__mobile-bg').fadeOut('fast', 'swing');
    });
    $(".news__list").slick({
        dots: false,
        infinite: true,
        arrows: true,
        cssEase: 'linear',
        autoplaySpeed: 2000,
        speed: 300,
        slidesToShow: 4,
        prevArrow: '<svg class="slick-arrow slick-arrow-prev" width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg"><circle r="21" transform="matrix(-1 0 0 1 21 21)" fill="#DDE2E5"/><g clip-path="url(#clip4)"><path d="M16.3442 20.5061L24.6697 12.2036C24.9425 11.9317 25.3841 11.9321 25.6565 12.205C25.9286 12.4777 25.9279 12.9196 25.655 13.1917L17.8251 21L25.6553 28.8083C25.9281 29.0805 25.9288 29.522 25.6567 29.7949C25.5202 29.9316 25.3414 30 25.1625 30C24.9842 30 24.806 29.9321 24.6698 29.7963L16.3442 21.494C16.2128 21.3633 16.1391 21.1854 16.1391 21C16.1391 20.8147 16.213 20.637 16.3442 20.5061Z" fill="#393185"/></g><defs><clipPath id="clip4"><rect width="18" height="18" fill="white" transform="matrix(-1 0 0 1 30 12)"/> </clipPath> </defs></svg>',
        nextArrow: '<svg  class="slick-arrow slick-arrow-next" width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="21" cy="21" r="21" fill="#DDE2E5"/><g clip-path="url(#clip4)"><path d="M25.6558 20.5061L17.3303 12.2036C17.0575 11.9317 16.6159 11.9321 16.3435 12.205C16.0714 12.4777 16.0721 12.9196 16.345 13.1917L24.1749 21L16.3447 28.8083C16.0719 29.0805 16.0712 29.522 16.3433 29.7949C16.4798 29.9316 16.6586 30 16.8375 30C17.0158 30 17.194 29.9321 17.3302 29.7963L25.6558 21.494C25.7872 21.3633 25.8609 21.1854 25.8609 21C25.8609 20.8147 25.787 20.637 25.6558 20.5061Z" fill="#393185"/></g><defs><clipPath id="clip4"><rect width="18" height="18" fill="white" transform="translate(12 12)"/></clipPath></defs></svg>',
        responsive: [{
                breakpoint: 1400,
                settings: {
                    slidesToShow: 3,
                }
            },
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 2,
                }
            },
            {
                breakpoint: 770,
                settings: {
                    slidesToShow: 1,
                    arrows: false
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
    });
    $(window).resize(function() {
        if (window.innerWidth <= 770) {
            $(".specialOffers__list").slick({
                dots: false,
                infinite: true,
                arrows: false,
                cssEase: 'linear',
                autoplaySpeed: 2000,
                speed: 300,
                slidesToShow: 1,
                adaptiveHeight: true,
                autoplay: true,
                prevArrow: '<svg width="7" class="slick-arrow slick-arrow-prev" height="11" viewBox="0 0 7 11" fill="none" xmlns="https://www.w3.org/2000/svg"><path d="M0.65491 5.19814L5.74273 0.124392C5.90943 -0.0417463 6.17932 -0.041467 6.34573 0.125251C6.51202 0.291948 6.51159 0.561984 6.34487 0.728251L1.55989 5.50002L6.34505 10.2718C6.51174 10.4381 6.51217 10.7079 6.3459 10.8746C6.26248 10.9582 6.15319 11 6.0439 11C5.93489 11 5.82603 10.9585 5.74275 10.8755L0.65491 5.80187C0.574623 5.72199 0.52957 5.61328 0.52957 5.50002C0.52957 5.38675 0.574751 5.27817 0.65491 5.19814Z" fill="#393185"/></svg>',
                nextArrow: '<svg width="7" class="slick-arrow slick-arrow-next" height="11" viewBox="0 0 7 11" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M6.34509 5.19814L1.25727 0.124392C1.09057 -0.0417463 0.820684 -0.041467 0.654267 0.125251C0.487979 0.291948 0.488408 0.561984 0.655127 0.728251L5.44011 5.50002L0.654955 10.2718C0.488258 10.4381 0.487828 10.7079 0.654095 10.8746C0.737519 10.9582 0.846809 11 0.9561 11C1.06511 11 1.17397 10.9585 1.25725 10.8755L6.34509 5.80187C6.42538 5.72199 6.47043 5.61328 6.47043 5.50002C6.47043 5.38675 6.42525 5.27817 6.34509 5.19814Z" fill="#393185"/></svg>',
            });

        }

    });





    var didScroll, lastScrollTop = 0,
        delta = 5,
        navbarHeight = $(".header-top").outerHeight() / 4;

    function hasScrolled() {
        var e = $(this).scrollTop();
        Math.abs(lastScrollTop - e) <= delta || (e > lastScrollTop && e > navbarHeight ? $(".header-top").removeClass("nav-down").addClass("nav-up") : (e + $(window).height() < $(document).height() && $(".header-top").removeClass("nav-up").addClass("nav-down"), e < navbarHeight && $(".header-top").removeClass("nav-down")), lastScrollTop = e)
    }

    function setSameHeight() {
        var e, t, n, o, a = 0,
            i = 0,
            r = [],
            c = 0;
        $(".sameHeight").each(function() {
            if ((t = $(this)).css("height", "auto"), n = t.height(), c = t.offset().top, i != c) r.length = 0, i = c, a = n, t.height(a), r.push(t);
            else if (r.push(t), e = r.length, a < n)
                for (a = n, o = 0; o < e; o++) r[o].height(a);
            else t.height(a)
        })
    }

    function scrollToElementCentered(e) { $("html,body").animate({ scrollTop: e.offset().top - ($(window).height() - e.outerHeight(!0)) / 2 }, 400) }

    function getCookie(e) {
        for (var t = e + "=", n = decodeURIComponent(document.cookie).split(";"), o = 0; o < n.length; o++) {
            for (var a = n[o];
                " " == a.charAt(0);) a = a.substring(1);
            if (0 == a.indexOf(t)) return a.substring(t.length, a.length)
        }
        return ""
    }

    function setCookie(e, t, n) {
        var o = new Date;
        o.setTime(o.getTime() + 24 * n * 60 * 60 * 1e3);
        var a = "expires=" + o.toUTCString();
        document.cookie = e + "=" + t + ";" + a + ";path=/;"
    }

    function deleteCookie(e) { document.cookie = e + "=;expires=Thu, 01 Jan 1970 00:00:01 GMT;path=/;" }
    $(window).scroll(function(e) { didScroll = !0 }), setInterval(function() { didScroll && (hasScrolled(), didScroll = !1) }, 250), $(hasScrolled), $(document).ready(function() { setSameHeight(), $(window).on("resize", function(e) { setSameHeight() }), $(window).on("orientationchange", function(e) { setSameHeight() }) }), $(document).ready(function() {
        document.cookie.indexOf("accept_cookies") > -1 && $("#any-cookieBar, #btnCookieBarPlaceholder").hide(), $("#any-cookieBar-close").change(function() {
            var e = new Date;
            e.setTime(e.getTime() + 31536e6), document.cookie = "accept_cookies=true; expires=" + e.toGMTString() + "; path=/; domain=.anydesk.com", $("#btnCookieBarPlaceholder").hide()
        })
    }), $(function() { $(window).scroll(function() { $(this).scrollTop() > 500 ? $("#any-backToTop").show().removeClass("fadeOutRight").addClass("fadeInRight") : $(this).scrollTop() < 500 && $("#any-backToTop").removeClass("fadeInRight").addClass("fadeOutRight") }), $("#any-backToTop").click(function() { return $("html, body").animate({ scrollTop: 0 }, 600, function() { window.location.hash = "" }), !1 }) }), $(document).ready(function() { $('a[rel="relativeanchor"]').click(function() { return $("html, body").animate({ scrollTop: $($.attr(this, "href")).offset().top }, 800), !1 }) }), document.addEventListener("DOMContentLoaded", function() {
        var e = [].slice.call(document.querySelectorAll("img.lazy")),
            t = !1,
            n = function() {
                !1 === t && (t = !0, e.forEach(function(t) {
                    if (t.getBoundingClientRect().top - 200 <= window.innerHeight && t.getBoundingClientRect().bottom >= 0 && "none" !== getComputedStyle(t).display) {
                        var o = t.dataset.imgSrc.split("width");
                        if (o) {
                            "" == o[o.length - 1] && o.pop();
                            for (var a = [], i = 0; i < o.length; i++) {-1 == (c = o[i].trim().split(" "))[0].indexOf(".webp") && a.push({ path: c[0], size: c[1] }) }
                            a = a.sort(function(e, t) { return e.size < t.size ? 1 : e.size > t.size ? -1 : 0 });
                            var r = !1;
                            for (i = 0; i < a.length; i++) {
                                var c = a[i];
                                screen.width <= c.size && (t.src = c.path, r = !0)
                            }
                            r || (t.src = t.dataset.src)
                        } else t.src = t.dataset.src;
                        t.classList.remove("lazy"), 0 === (e = e.filter(function(e) { return e !== t })).length && (document.removeEventListener("scroll", n), window.removeEventListener("resize", n), window.removeEventListener("orientationchange", n))
                    }
                }), t = !1)
            };
        document.addEventListener("scroll", n), window.addEventListener("resize", n), window.addEventListener("orientationchange", n), n()
    }), $(".navbar-toggler").click(function(e) { "true" == $(this).attr("aria-expanded") && ($(".navbar").find(".any-arrow-dropdown-menu-mobile").hide(), $(".navbar-bg").hide()), "false" == $(this).attr("aria-expanded") && ($(".navbar").find(".any-arrow-dropdown-menu-mobile").show(), $(".navbar-bg").show()), e.preventDefault() }), $(".navbar-bg").click(function(e) { $(e.target).is(".navbar-collapse") || $(".navbar-collapse").collapse("hide"), $(".navbar").find(".any-arrow-dropdown-menu-mobile").hide(), $(this).hide() }), $(document).ready(function() { $(".card-header-accordion").click(function(e) { $(this).removeClass("initial-load") }) }), $(function() { window.setTimeout(function() { $(".any-bubbleBadge").show(), $(".any-bubbleBadge-template").show(), $(".any-bubbleBadge-newLicenses").show(), $(".any-bubbleBadge-landingPageHeader").show() }, 1e3) }), $(document).ready(function() { $("[data-href]").click(function() { return window.location.href = $(this).data("href"), !1 }), $("[data-href-tab]").click(function() { return window.open($(this).data("href-tab"), "_blank"), !1 }), $("[data-href], [data-href-tab]").addClass("cursor-pointer") }), $("#alertClose").click(function() { $("#alertMessage").slideUp(300, function() { $(this).alert("close") }) }), $(document).ready(function() { $("[data-cookie-value]").each(function() { $(this).val(getCookie($(this).data("cookie-value"))), $(this).removeAttr("data-cookie-value") }) });

    $('.tabs').on('click', 'a', function(e) {
        e.preventDefault();
        var tabId = $(this).attr('data-tab');
        $(this).closest('.tabs').find('a').removeClass('active');
        $(this).addClass('active');
        $('.tab-panel').hide('slow');
        $('#' + tabId).show('slow');
    });




    $("#tel").mask("+7(999)999-99-99");
    $("#KPTel").mask("+7(999)999-99-99");





});