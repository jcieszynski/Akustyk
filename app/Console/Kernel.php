<?php

namespace App\Console;

use Carbon\Carbon;
use DB;
use http\Client\Curl\User;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param \Illuminate\Console\Scheduling\Schedule $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('blacklist:update-email-domains')
            ->monthly()
            ->saturdays()
            ->at('06:00')
            ->withoutOverlapping()
            ->sendOutputTo(storage_path('logs/email-domains-blacklist.txt'));

        $schedule->call(function () {
            DB::table('users')->where('last_login', '<=',
                Carbon::now()->subYears(1))->delete();
        })->monthly()->sundays()->at('08:00')->sendOutputTo(storage_path('logs/konta_del.txt'));

    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}
