{extends file="parent:frontend/index/shop-navigation.tpl"}
{block name='frontend_index_search'}
	<li class="navigation--entry logo_block">
		  <div class="logo-main block-group" role="banner">
				<div class="logo--shop block">
					  <a class="logo--link" href="{url controller='index'}" title="{"{config name=shopName}"|escapeHtml} - {$snippetIndexLinkDefault|escape}">
					Brillenglas-Tausch.de
					</a>
				</div>
			</div>
	</li>
{/block}
