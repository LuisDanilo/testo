import { Page, Browser } from 'puppeteer'
import { expect } from 'chai'
import { PageInitFunction } from '.'

class IndexPage{

    private readonly page: Page

    constructor(page: Page) {
        this.page = page
    }

    async getHeaderText() {
        return await this.page.evaluate( s => document.querySelector(s).innerHTML, 'main > h1')
    }
}

export const IndexPageTest = (pageInit: PageInitFunction ) => {
    let page: Page | null
    let browser: Browser | null

    beforeEach(async () => {
        const init = await pageInit('/')
        page = init.page
        browser = init.browser
    })

    describe('Welcome page test', () => {
        it('Check header text', async () => {
            if ( page ) {
                const text = await page.evaluate((s: any) => document.querySelector(s).innerHTML, 'main > h1')
                expect(text).to.contain('Welcome')
            } else {
                expect.fail(`Test couldn't be performed`)
            }
        })
    })

    afterEach( async () => {
        if ( browser ) await browser.close()
    })
}
