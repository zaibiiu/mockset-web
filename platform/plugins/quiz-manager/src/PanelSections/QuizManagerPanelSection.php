<?php

namespace Botble\QuizManager\PanelSections;

use Botble\Base\PanelSections\PanelSection;

class QuizManagerPanelSection extends PanelSection
{
    public function setup(): void
    {
        $this
            ->setId('settings.{id}')
            ->setTitle('{title}')
            ->withItems([
                //
            ]);
    }
}
