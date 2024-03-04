<!-- BEGIN: main -->

<div class="section-news">
    <h2>24h Công nghệ</h2>
    <div class="row">
        <!-- BEGIN: loop0 -->
        <div class="col-xs-24 col-md-12 first-new">
            <!-- BEGIN: img -->
            <a href="{ROW.link}" title="{ROW.title}" {ROW.target_blank}><img src="{ROW.thumb}" alt="{ROW.title}"
                    class="" /></a>
            <!-- END: img -->
            <h3><a {TITLE} class="show" href="{ROW.link}" {ROW.target_blank}>{ROW.title_clean}</a></h3>
            <p>{ROW.hometext_clean}</p>
        </div>
        <!-- END: loop0 -->
        <div class="col-xs-24 col-md-12">
            <ul>
                <!-- BEGIN: loop -->
                <li>
                    <!-- BEGIN: img -->
                    <figure><a href="{ROW.link}" title="{ROW.title}" {ROW.target_blank}><img src="{ROW.thumb}" alt="{ROW.title}"
                    /></a></figure>
                    <!-- END: img -->
                    <div class="info">
                        <h3><a {TITLE} class="show" href="{ROW.link}" {ROW.target_blank}>{ROW.title_clean}</a></h3>
                        <span class="publtime">{ROW.publtime}</span>
                        <p>{ROW.hometext_clean}</p>
                    </div>
                </li>
                <!-- END: loop -->
            </ul>
        </div>
    </div>
</div>

<!-- BEGIN: tooltip -->
<script type="text/javascript">
    $(document).ready(function() {$("[data-rel='block_tooltip'][data-content!='']").tooltip({
    placement: "{TOOLTIP_POSITION}",
    html: true,
        title: function(){return ( $(this).data('img') == '' ? '' : '<img class="img-thumbnail pull-left margin_image" src="' + $(this).data('img') + '" width="90" />' ) + '<p class="text-justify">' + $(this).data('content') + '</p><div class="clearfix"></div>';}
    });
    });
</script>
<!-- END: tooltip -->
<!-- END: main -->