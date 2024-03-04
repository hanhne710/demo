<!-- BEGIN: main -->
<!-- BEGIN: loop -->
<div class="panel panel-default panel-shops-cat">
    <div class="panel-heading clearfix">
        <h2><a href="{LINK_CATALOG}" title="{TITLE_CATALOG}">{TITLE_CATALOG}</a></h2>
        <span class="more-cats" id="more_cats_{ID_CATALOG}">
            <!-- BEGIN: subcatloop --><a data-toggle="load-products" href="javascript:;" data-parentid="{ID_CATALOG}" data-catid="{SUBCAT.catid}" data-alias="{SUBCAT.alias}" data-link="{SUBCAT.link}" title="{SUBCAT.title}">{SUBCAT.title}</a><!-- END: subcatloop -->
        </span>
    </div>
    <div class="panel-body" id="viewcat_contents_{ID_CATALOG}">
        {CONTENT}
    </div>
</div>
<!-- END: loop -->

<script type="text/javascript">
    var inProcess = false;
    $(document).ready(() => {
        $('a[data-toggle="load-products"]').click((e) => {
            var catid = $(e.target).data('catid');
            var alias = $(e.target).data('alias');
            var link = $(e.target).data('link');
            var parentid = $(e.target).data('parentid');
            $.ajax({
                type: "GET",
                url: nv_base_siteurl + 'index.php?' + nv_lang_variable + '=' + nv_lang_data +
                    '&' + nv_name_variable + '=san-pham&' + nv_fc_variable +
                    '=ajax_load_product' + '&catid=' + catid + "&nocache=" + new Date().getTime(),
                data: '',
                success: function(data) {
                    $("#viewcat_contents_"+parentid).html(data);
                    // active, link more
                    $('a[data-catid=' + catid + ']').addClass("active");
                    $('#more_cats_'+parentid+' a[data-catid!=' + catid + ']').removeClass("active");
                }
            });
        });
    });
</script>
<!-- END: main -->


