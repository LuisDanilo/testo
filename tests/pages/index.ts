import { Browser, Page } from 'puppeteer'

export * from './index.page'
export type PageInitFunction = (path: string) => Promise<{ page: Page; browser: Browser}>