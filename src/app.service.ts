import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return '<h3>DevSecOps Trial Project Updated</h3>';
  }
}
