import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { Request, Response, NextFunction } from 'express';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Middleware para redirigir tráfico del dominio Koyeb
  app.use((req: Request, res: Response, next: NextFunction) => {
    if (req.hostname.includes('koyeb.app')) {
      return res.redirect(301, 'https://s2.dustify.app' + req.url);
    }
    next();
  });

  await app.listen(process.env.PORT ?? 4000);
}
bootstrap();
