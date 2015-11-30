# Docker-xhprof

## How to install

### Update your Dockerfile

Replace "FROM php:5.4-apache" by "FROM xhprof:5.4-apache" on your project Dockerfile

### How to profile your code

```php
if (extension_loaded('xhprof')) {
    xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY, array('ignored_functions' => array(
        // list of functions to ignore
    )));
}

// your code to profile...

if (extension_loaded('xhprof')) {
    $xhprof_data = xhprof_disable();

    $XHPROF_ROOT = '../../xhprof/';
    include_once $XHPROF_ROOT . '/xhprof_lib/utils/xhprof_lib.php';
    include_once $XHPROF_ROOT . '/xhprof_lib/utils/xhprof_runs.php';

    $xhprof_runs = new XHProfRuns_Default();
    $run_id = $xhprof_runs->save_run($xhprof_data, "xhprof_testing");
}
```

## See the profiling results

http://darwin.xhprof.dev.affiliatewindow.com/
