<!-- BEGIN: main -->
<link rel="stylesheet" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/slick/slick.css" />
<link rel="stylesheet" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/slick/slick-theme.css" />
<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/slick/slick.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#home-slider').slick({
            dots: false,
            infinite: true,
            speed: 1200,
            slidesToShow: 2,
            slidesToScroll: 1,
            swipeToSlide: true,
            autoplay: true,
            autoplaySpeed: 5000,
            responsive: [{
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        infinite: true
                    }
                }
            ]
        });
    });
</script>

<div id="home-slider">
    <!-- BEGIN: loop -->
    <div class="item">
        <!-- BEGIN: image_only --><img src="{ROW.image}" data-thumb="{ROW.image}" title="{ROW.description}" />
        <!-- END: image_only -->
        <!-- BEGIN: image_link --><a href="{ROW.link}" <!-- BEGIN: target --> target="{ROW.target}"
            <!-- END: target -->>
            <img src="{ROW.image}" data-thumb="{ROW.image}" title="{ROW.description}" />
        </a><!-- END: image_link -->
    </div>
    <!-- END: loop -->
</div>
<!-- END: main -->