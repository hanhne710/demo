<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css">
<form action="{BASE_URL_SITE}index.php" name="fsea" method="get" id="fsea" class="form-horizontal">
    <div class="panel panel-default">
        <div class="panel-heading">{LANG.search_title}</div>
        <div class="panel-body">
            <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" /> <input type="hidden"
                name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" /> <input type="hidden" name="{NV_OP_VARIABLE}"
                value="{OP_NAME}" />
            <div class="form-group">
                <label class="col-xs-4 col-sm-4 col-md-4 control-label">{LANG.key_title}</label>
                <div class="col-xs-20 col-sm-20 col-md-20">
                    <input type="text" name="q" value="{KEY}" class="form-control" id="key" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label">{LANG.catagories}</label>
                <div class="col-sm-20">
                    <select name="catid" class="form-control">
                        <!-- BEGIN: search_cat -->
                        <option value="{SEARCH_CAT.catid}" {SEARCH_CAT.select}>{SEARCH_CAT.xtitle}{SEARCH_CAT.title}
                        </option>
                        <!-- END: search_cat -->
                    </select>
                </div>
            </div>
            <div class="text-center">
                <input class="btn btn-primary" type="submit" value="{LANG.search_title}" /> <input
                    class="btn btn-warning" type="button" value="{LANG.search_reset}" id="reset" />
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" data-show="after" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js">
</script>
<script type="text/javascript" data-show="after"
    src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<script type="text/javascript" data-show="after">
    $(document).ready(function() {
        $("#to_date,#from_date").datepicker({
            showOn: "both",
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            showOtherMonths: true,
            buttonImage: nv_base_siteurl + "assets/images/calendar.gif",
            buttonImageOnly: true
        });
    });
    $("#reset").click(function() {
        $('#from_date').val("");
        $('#to_date').val("");
        $('#key').val("");
    });
</script>
<!-- END: main -->
<!-- BEGIN: results -->
<h3 class="text-center" style="font-size: 18px;">
    <em class="fa fa-filter">&nbsp;</em>{LANG.search_on} {TITLE_MOD}
</h3>
<hr />
<!-- BEGIN: noneresult -->
<p>
    <em>{LANG.search_none} : <strong class="label label-info">{KEY}</strong> {LANG.search_in_module}
        <strong>{INMOD}</strong></em>
</p>
<!-- END: noneresult -->

<div class="roww viewgrid shops-viewgrid">
    <!-- BEGIN: result -->
    <div class="col-xs-12 col-sm-12 col-md-6">
        <div class="shop-item">
            <div class="item-image">
                <a href="{LINK}" title="{TITLE}"><img src="{IMG_SRC}" alt="{TITLE}"></a>
            </div>
            <div class="info_pro">
                <!-- BEGIN: discounts -->
                <span class="label label-danger sale-label">Giảm
                    {PRICE.discount_percent}{PRICE.discount_unit}</span>
                <!-- END: discounts -->
                <!-- BEGIN: point -->
                <span class="label label-info" title="{point_note}">+{point}</span>
                <!-- END: point -->
                <!-- BEGIN: gift -->
                <span class="label label-success">+<em class="fa fa-gift fa-lg">&nbsp;</em></span>
                <!-- END: gift -->
            </div>
            <div class="caption">
                <h3>
                    <a href="{LINK}" title="{TITLE}">{TITLEROW}</a>
                </h3>
                <!-- BEGIN: price -->
                <p class="price">
                    <!-- BEGIN: discounts -->
                    <span class="money">{PRICE.sale_format}{PRICE.unit}</span> <del
                        class="discounts_money">{PRICE.price_format}{PRICE.unit}</del>
                    <!-- END: discounts -->
                    <!-- BEGIN: no_discounts -->
                    <span class="money">{PRICE.price_format}{PRICE.unit}</span>
                    <!-- END: no_discounts -->
                </p>
                <!-- END: price -->
                <!-- BEGIN: contact -->
                <p class="price">
                    <span class="money">{LANG.price_contact}</span>
                </p>
                <!-- END: contact -->
            </div>
        </div>
    </div>
    <!-- END: result -->
</div>
<!-- BEGIN: pages_result -->
<div class="text-center">{VIEW_PAGES}</div>
<!-- END: pages_viewpages -->

<!-- END: results -->