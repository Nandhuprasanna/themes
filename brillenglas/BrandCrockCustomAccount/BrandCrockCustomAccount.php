<?php
/**
 * To plugin Bootstrap file.
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
namespace BrandCrockCustomAccount;
use Shopware\Components\Plugin;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\ActivateContext;
use Shopware\Components\Plugin\Context\DeactivateContext;
/**
 * Shopware-Plugin BrandCrockCustomAccount.
 */
class BrandCrockCustomAccount extends Plugin
{

    /**
     * This method can be overridden
     *
     * @param ActivateContext $context
     */
    public function activate(ActivateContext $context)
    {
        $context->scheduleClearCache(InstallContext::CACHE_LIST_ALL);
    }

    /**
     * This method can be overridden
     *
     * @param DeactivateContext $context
     */
    public function deactivate(DeactivateContext $context)
    {
        $context->scheduleClearCache(InstallContext::CACHE_LIST_ALL);
    }
    	
	 /**
     * @param Plugin\Context\InstallContext $installContext
     * Adds the attributes to the database and creates the mail template.
     *
     * Adds the widget to the database and creates the database schema.
     *
     */
    public function install(Plugin\Context\InstallContext $installContext)
    {
        parent::install($installContext);
        $installContext->scheduleClearCache(InstallContext::CACHE_LIST_ALL);
    }
    
    /**
     * @param Plugin\Context\UninstallContext $uninstallContext
     * Remove widget and remove database schema.
     */
    public function uninstall(Plugin\Context\UninstallContext $uninstallContext)
    {
        parent::uninstall($uninstallContext);
        $uninstallContext->scheduleClearCache(InstallContext::CACHE_LIST_ALL);
    }
    
    
    public static function getSubscribedEvents()
    {
        return [
           'Shopware_Controllers_Frontend_Account::indexAction::after' => 'indexAction',
        ];
    }

    public function indexAction(\Enlight_Event_EventArgs $args)
    {
		$this->admin = Shopware()->Modules()->Admin();
	    $subject = $args->getSubject();
        $view = $subject->View();
        $destinationPage = (int) $subject->Request()->sPage;
        $orderData = $this->admin->sGetOpenOrderData($destinationPage,3);
        $orderData = $this->applyTrackingUrl($orderData);
        $view->assign('sOpenOrders', $orderData['orderData']);
        $view->assign('sNumberPages', $orderData['numberOfPages']);
        $view->assign('sPages', $orderData['pages']);

        //this has to be assigned here because the config method in smarty can't handle array structures
        $view->assign('sDownloadAvailablePaymentStatus', Shopware()->Config()->get('downloadAvailablePaymentStatus'));
    }
   
    /**
     * @param array $orderData
     *
     * @return array
     */
    private function applyTrackingUrl(array $orderData)
    {
        foreach ($orderData['orderData'] as &$order) {
            if (!empty($order['trackingcode']) && !empty($order['dispatch']) && !empty($order['dispatch']['status_link'])) {
                $order['dispatch']['status_link'] = $this->renderTrackingLink(
                    $order['dispatch']['status_link'],
                    $order['trackingcode']
                );
            }
        }

        return $orderData;
    }

    /**
     * @param string $link
     * @param string $trackingCode
     *
     * @return string
     */
    private function renderTrackingLink($link, $trackingCode)
    {
        $regEx = '/(\{\$offerPosition.trackingcode\})/';

        return preg_replace($regEx, $trackingCode, $link);
    }
}
?>
