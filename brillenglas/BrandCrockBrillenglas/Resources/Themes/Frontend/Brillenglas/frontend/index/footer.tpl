{extends file="parent:frontend/index/footer.tpl"}


{* Service hotline *}
{block name="frontend_index_footer_column_service_hotline"} 
    <div class="footer--column column--hotline is--first block">
        {block name="frontend_index_footer_column_service_hotline_headline"}
            <div class="column--headline">Kontakt</div>
        {/block}

        {block name="frontend_index_footer_column_service_hotline_content"}
            <div class="column--content">
                <p class="column--desc">
					<div class="questions">
					<p>Haben Sie Fragen?</p>
					<p>Oder benötigen Sie Beratung</p>
					<p>zu einer individuellen Lösung?</p>
					</div>

					<div class="writeus">
					<p>Oder schreiben Sie uns:</p>
					<a href="mailto:service@brillenglas-tausch.de" class="footer--phone-link">service@brillenglas-tausch.de</a>
					</div>
					<p>Write Oder schreiben Sie uns:</p>
				</p>
            </div>
        {/block}
    </div>
{/block}
 {block name="frontend_index_footer_column_service_menu_content" append}
{$smarty.block.parent}
<img class="trustedbadge"  src="{$theme.bril_trustedbadge}"> 
{/block}
