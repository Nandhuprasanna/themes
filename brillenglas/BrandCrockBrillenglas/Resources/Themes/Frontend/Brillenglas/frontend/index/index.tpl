{extends file="parent:frontend/index/index.tpl"}
{block name='frontend_index_navigation'append}
{$smarty.block.parent}
	{if {controllerName|lower} == 'index'}
		<img src="{$theme.br_banner_image}" class="bnr_brill_img"><br>										
		<img src="{$theme.br_mobile_banner}" class="mobile_bnr_brill_img"><br>		
	{/if}
{/block}

{block name='frontend_index_logo_container'}
	{if $theme.brillengglas_Promotion_Topbar}  
		{$theme.br_text_area}
	{/if}
 {$smarty.block.parent}

{/block}


    {block name='frontend_index_after_body'}
    {if $theme.brillengglas_back_to_top}
		<span id="pageYOffset"><span id="position"></span></span>
		<button id="goTop"><i class="icon--arrow-up"></i></button>
	{/if}
		<input type="hidden" id="brillengglas_back_to_top" value="{$theme.brillengglas_back_to_top}">
    {/block}


{* Maincategories navigation top *}
{block name='frontend_index_navigation_categories_top'}
	<nav class="navigation-main">
		<div class="container" data-menu-scroller="true" data-listSelector=".navigation--list.container" data-viewPortSelector=".navigation--list-wrapper">
			{include file="frontend/index/logo-container.tpl"}
			{block name="frontend_index_navigation_categories_top_include"}
				{include file='frontend/index/main-navigation.tpl'}
			{/block}
		</div>
	</nav>
{/block}


{block name='frontend_index_content_main' append}

	{if {controllerName|lower} == 'checkout' && {controllerAction|lower} == 'finish'}
	{$smarty.block.parent}
	{elseif {controllerName|lower} == 'account' || {controllerName|lower} == 'register'|| {controllerName|lower} == 'checkout'}  
	{$smarty.block.parent}
	{if $bcBasketData}

<!--
	{$bcBasketData|print_r}
-->

		<div class="bcright-sidebar">
		<div class="basket--details">
		<h2>Ihre Auswahl</h2>
		<p>Premiumgläser </p>
		<p>Gläser für eine Halbrandbrille </p>
		<ul>
<!--
		<li class="price--details">
		<span>BasicPrices:</span>
		<span class="amount">{$bcBasketData.AmountNumeric|currency}</span>
		</li>
-->
		{if $sBasketItem.ordernumber == 'sw-surcharge'}
		<li class="price--details">
		<span>Surcharge:</span>
		<span class="amount--tax">{$bcBasketData.AmountNumeric|currency}</span>
		</li>
		{/if}
		<li class="price--details tot">
		<span>Gesamt:</span>
		<span class="amount">{$bcBasketData.AmountNumeric|currency}</span>
		</li>
		</ul>
		</div>
		<div class="bc--payment--logos">
		<h3>Zahlungsmethoden</h3>
		<span class="bc--images"><img src="{link file='frontend/_public/src/img/klarna-logo.png'}"></span>
		<span class="bc--images"><img src="{link file='frontend/_public/src/img/paypal.png'}"></span>
		<span class="bc--images"><img src="{link file='frontend/_public/src/img/mastercard.png'}"></span>
		<span class="bc--images"><img src="{link file='frontend/_public/src/img/visa.png'}"></span>
		</div>

		</div>
	{else}
	
	
		<div class="bcright-sidebar">
		<div class="basket--details">
		<h2>Ihre Auswahl</h2>
		<p>Premiumgläser </p>
		<p>Gläser für eine Halbrandbrille </p>
		<ul>
		<li class="price--details">
		<span>BasicPrices:</span>
		<span class="amount">{$sBasketItem.price|currency}</span>



		</li>
		{if $sBasketItem.ordernumber == 'sw-surcharge'}
		<li class="price--details">
		<span>Surcharge:</span>
		<span class="amount--tax">{$sBasketItem.price|currency}</span>
		</li>
		{/if}
		<li class="price--details tot">
		<span>Gesamt:</span>
		<span class="amount--tax">{if $sAmountWithTax && $sUserData.additional.charge_vat}{$sAmountWithTax|currency}{else}{$sAmount|currency}{/if}</span>
		</li>
		</ul>
		</div>
		<div class="bc--payment--logos">
		<h3>Zahlungsmethoden</h3>
		<span class="bc--images"><img src="{link file='frontend/_public/src/img/klarna-logo.png'}"></span>
		<span class="bc--images"><img src="{link file='frontend/_public/src/img/paypal.png'}"></span>
		<span class="bc--images"><img src="{link file='frontend/_public/src/img/mastercard.png'}"></span>
		<span class="bc--images"><img src="{link file='frontend/_public/src/img/visa.png'}"></span>
		</div>

		</div>
		{/if}
		{else}
	{$smarty.block.parent}
	{/if}
{/block}
    
