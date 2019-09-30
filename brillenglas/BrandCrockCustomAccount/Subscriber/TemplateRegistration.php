<?php
/**
 * Plugin subscriber file
 *
 * Copyright (C) BrandCrock GmbH. All rights reserved
 *
 * If you have found this script useful a small
 * recommendation as well as a comment on our
 * home page(https://brandcrock.com/)
 * would be greatly appreciated.
 *
 * @author  BrandCrock
 * @package BrandCrockCustomAccount
 */
namespace BrandCrockCustomAccount\Subscriber;

use Doctrine\Common\Collections\ArrayCollection;
use Enlight\Event\SubscriberInterface;
use Shopware\Components\Theme\LessDefinition;
use Enlight_Template_Manager;

class TemplateRegistration implements SubscriberInterface
{
    
    /**
     * @var Enlight_Template_Manager
     */
    private $templateManager;

    /**
     * @var string
     */
    private $pluginBaseDirectory;

    /**
     * @param string                   $pluginBaseDirectory
     * @param Enlight_Template_Manager $templateManager
     */
    public function __construct($pluginBaseDirectory, Enlight_Template_Manager $templateManager)
    {
        $this->templateManager = $templateManager;
        $this->pluginBaseDirectory = $pluginBaseDirectory;
    }
    
    /**
     * {@inheritdoc}
     */
    public static function getSubscribedEvents()
    {
        return array(

            'Enlight_Controller_Action_PreDispatch' => 'onPreDispatch',
            'Theme_Compiler_Collect_Plugin_Less' => 'addLessFiles'
        );
    }
    
    /**
     * Define view path
     */
    public function onPreDispatch()
    {
        $this->templateManager->addTemplateDir($this->pluginBaseDirectory . '/Resources/views');
    }
    
    
    /**
    * Provides the less files for compression
    *
    * @return ArrayCollection
    */
    public function addLessFiles()
    {
        $less = new LessDefinition(
            [], // configuration
            [__DIR__ . '/../Resources/views/frontend/_public/src/css/style.css'], // less files to compile
            __DIR__ // import directory
        );

        return new ArrayCollection([$less]);
    }
}
