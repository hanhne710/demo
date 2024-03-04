<!-- BEGIN: main -->
{FILE "header_only.tpl"}
{FILE "header_extended.tpl"}
<main class="wraper">
    <div class="row">
        [HEADER]
    </div>
    <div class="row">
        <div class="col-md-24">
            [TOP]
            {MODULE_CONTENT}
            [BOTTOM]
        </div>
    </div>
    <div class="row">
        [FOOTER]
    </div>
</main>
{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->