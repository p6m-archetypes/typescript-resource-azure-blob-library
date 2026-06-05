import { BlobServiceClient, StorageSharedKeyCredential } from '@azure/storage-blob';
import { settings } from '../settings';

let _client: BlobServiceClient | null = null;

export function initAzureBlob(): void {
  const credential = new StorageSharedKeyCredential(
    settings.azureAccountName,
    settings.azureAccountKey,
  );
  _client = new BlobServiceClient(settings.azureEndpoint, credential);
}

export function getAzureBlob(): BlobServiceClient {
  if (!_client) throw new Error('Azure Blob not initialized — call initAzureBlob() first');
  return _client;
}
