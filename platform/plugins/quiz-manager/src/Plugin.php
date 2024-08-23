<?php

namespace Botble\QuizManager;

use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('Quiz Managers');
        Schema::dropIfExists('Quiz Managers_translations');
    }
}
