#!/usr/bin/node

const puppeteer = require('puppeteer');

const sleep = ms => {
    return new Promise(resolve => {
        setTimeout(resolve, ms);
    });
}

(async () => {
    const browser = await puppeteer.launch({ args: ['--no-sandbox'] });
    const page = await browser.newPage();

    const src_dir = process.argv[2];
    const bin_dir = process.argv[3];
    const args = process.argv.slice(4);

    for (const arg of args) {
        await page.goto('file://' + __dirname + '/' + src_dir + '/' + arg);
        await page.pdf({
            path: bin_dir + '/' + arg.replace('.html', '.pdf'),
            format: 'Letter',
            printBackground: true,
        });

        console.log('Printed to pdf: ' + bin_dir + '/' + arg.replace('.html', '.pdf'));
    }

    await browser.close();
})();

