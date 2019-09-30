<?php
/**
 * To activate Brillenglas theme and less files.
 *
 * Copyright (C) BrandCrock AG. All rights reserved
 *
 * If you have found this script useful a small
 * recommendation as well as a comment on our
 * home page(https://brandcrock.com/)
 * would be greatly appreciated.
 *
 * @author  BrandCrock
 * @package Brillenglas
 */
namespace Shopware\Themes\Brillenglas;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    /**
     * Defines the extended Theme.
     *
     * @var string
     */
    protected $extend = 'Responsive';
    /**
     * Defines the human readable theme name which is displayed in the backend.
     *
     * @var string
     */
    protected $name = 'Brillenglas';
    /**
     * Allows to define a description text for the theme.
     *
     * @var string
     */
    protected $description = 'Brillenglas';
    /**
     * Name of the theme author.
     *
     * @var string
     */
    protected $author = 'Brandcrock';
    /**
     * License of the theme source code.
     *
     * @var string
     */
    protected $license = 'Brandcrock GmbH';
    /**
     * Css files which will be used in the theme.
     *
     * @var array
     */
     protected $css = array(
		'src/css/animate.css',
    );
    /**
     * Javascript files which will be used in the theme.
     *
     * @var array
     */
    protected $javascript = array(
	    'src/js/script.js',
    );
    /**
     * @param Form\Container\TabContainer $container
     */
    public function createConfig(Form\Container\TabContainer $container)
    {
		$tab = $this->createTab(
            'brillengglas_custom_tab',
            //$this->getbcLabelName('bc_theme_config_tabname'),
            'Brillenglas Theme Custom Settings',
            [
                'attributes' =>
                    [
                    'layout' => 'anchor',
                    'autoScroll' => true,
                    'padding' => '0',
                     
                ],
            ]
        );
        //General Settings
		$fieldset = $this->createFieldSet(
			'promotion_toggle1',
			'General Settings',
             array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'defaults' => array(
                        'columnWidth' => 1,
                        'labelWidth' => 200,
                        'margin' => '2 10 1 2'
                    )
                ),
                'height' => 700,
            )			
		); 
		$sSocialIcon = $this->createCheckboxField(
        'brillengglas_back_to_top', 
		 //~ $this->getbcLabelName('bc_theme_config_sports_back_to_top'),
		 'Back To Top',
		true       
       );
       
       $fieldset->addElement($sSocialIcon);
       
       $sPromotionbar = $this->createCheckboxField(
        'brillengglas_Promotion_Topbar', 
		 //~ $this->getbcLabelName('bc_theme_config_sports_Promotion_Topbar'),
		 'Promotion Topbar',
		true       
       );
        $fieldset->addElement($sPromotionbar);
        
        $textArea= $this->createTextAreaField(
                'br_text_area',
                'Custom Text Area',
                '',
                ['attributes' => ['xtype' => 'textarea', 'lessCompatible' => false], 'help' => '__additional_js_libraries_description__']
            );
       
        $fieldset->addElement($textArea);
       
		$tab->addElement($fieldset);  
		
		 //Image Urls
        $fieldset = $this->createFieldSet(
			'promotion_toggle2',
			'Image Urls',
             array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'defaults' => array(
                        'columnWidth' => 1,
                        'labelWidth' => 200,
                        'margin' => '2 10 1 2'
                    )
                ),
                'height' => 700,
            )			
		); 
		 $promotionIcons = $this->createFieldSet(
            'promotionicons',
            'Promotion Toggle Images'
          
        );
		$onepageedit= $this->createMediaField(
                'bc_pen_image',
                'Edit Pen Icon',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/pen.png',
                ['attributes' => ['lessCompatible' => true]]
            ); 
         $promotionIcons->addElement($onepageedit);
		$tickicon= $this->createMediaField(
                'bc_tick_bold',
                'Checkout Tick Icon',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/bold_tick.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($tickicon);
		$toggleimg1= $this->createMediaField(
                'br_user_icon',
                'User Icon',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/user.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg1);
		$toggleimg2= $this->createMediaField(
                'br_cart_icon',
                'Cart Icon',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/cart.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg2);
		$toggleimg3= $this->createMediaField(
                'br_gls_trans',
                'Brillenglas Glas',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/gls_trans.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg3);
		$toggleimg4= $this->createMediaField(
                'br_gls_cool',
                'Brillenglas Cool',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/gls_cool.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg4);
		$toggleimg5= $this->createMediaField(
                'br_gls_settings',
                'Brillenglas Settings',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/gls_settings.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg5);
		$toggleimg6= $this->createMediaField(
                'bc_tick_image',
                'Tick Icon',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/tick.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg6);
		$toggleimg7= $this->createMediaField(
                'br_index_image',
                'Accordian Image',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/index.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg7);
		$toggleimg8= $this->createMediaField(
                'br_index_image1',
                'Accordian Image1',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/banner3.jpg',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg8);
		$toggleimg9= $this->createMediaField(
                'br_index_image2',
                'Accordian Image2',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/banner3.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg9);
		$toggleimg11= $this->createMediaField(
                'br_lens_image',
                'Brillenglas Lens',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/lens.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg11);
		$toggleimg12= $this->createMediaField(
                'bril_trustedbadge',
                'Footer Trusted Badge',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/trustedshops.png',
                ['attributes' => ['lessCompatible' => true]]
            );
        $promotionIcons->addElement($toggleimg12);
		$toggleimg13= $this->createMediaField(
                'br_hamburger',
                'Menu Button',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/hamburger.png',
                ['attributes' => ['lessCompatible' => true]]
            );
        $promotionIcons->addElement($toggleimg13);
		$toggleimg14= $this->createMediaField(
                'br_banner_image',
                'Banner Image',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/banner.png',
                ['attributes' => ['lessCompatible' => true]]
            );
        $promotionIcons->addElement($toggleimg14);
		$toggleimg15= $this->createMediaField(
                'br_mobile_banner',
                'Mobile Banner Image',
                //~ $this->getbcLabelName('bc_theme_config_toggler_image1'),
                'custom/plugins/BrandCrockBrillenglas/Resources/Themes/Frontend/Brillenglas/frontend/_public/src/images/mobile_banner.png',
                ['attributes' => ['lessCompatible' => true]]
            );
         $promotionIcons->addElement($toggleimg15);
		 $fieldset->addElement($promotionIcons);
		 $tab->addElement($fieldset);  
		 $container->addTab($tab);  	
    }

}
