/**
 * Image Compressor Utility for Laravel Livewire
 * 
 * This utility provides image compression functionality for Laravel Livewire projects.
 * It can be used globally across different components in your application.
 */
window.ImageCompressor = {
    /**
     * Compress an image file
     * 
     * @param {File} file - The image file to compress
     * @param {number} quality - Compression quality (0 to 1)
     * @returns {Promise<File|null>} - Compressed file or null if compression fails
     */
    compress: function(file, quality = 0.7) {
        return new Promise((resolve) => {
            const reader = new FileReader();
            reader.readAsDataURL(file);

            reader.onload = (event) => {
                const img = new Image();
                img.src = event.target.result;

                img.onload = () => {
                    const canvas = document.createElement('canvas');
                    canvas.width = img.width;
                    canvas.height = img.height;

                    const ctx = canvas.getContext('2d');
                    ctx.drawImage(img, 0, 0);

                    canvas.toBlob((blob) => {
                        if (blob) {
                            const compressed = new File([blob], file.name, {
                                type: file.type,
                                lastModified: Date.now()
                            });
                            resolve(compressed);
                        } else {
                            resolve(null); // Handle toBlob() returning null
                        }
                    }, file.type, quality);
                };

                img.onerror = () => {
                    console.error("Error loading image:", file.name);
                    resolve(null);
                };
            };

            reader.onerror = () => {
                console.error("Error reading file:", file.name);
                resolve(null);
            };
        });
    },

    /**
     * Setup image input to automatically compress and upload files to a Livewire component
     * 
     * @param {string} inputId - ID of the file input element
     * @param {string} livewireProperty - Name of the Livewire property to upload to
     * @param {number} quality - Compression quality (0 to 1)
     * @param {Function} onSuccess - Callback on upload success
     * @param {Function} onError - Callback on upload error
     */
    setupLivewireUploader: function(inputId, livewireProperty, quality = 0.5, onSuccess = null, onError = null) {
        const input = document.getElementById(inputId);
        if (!input) {
            console.error(`Input element with ID '${inputId}' not found.`);
            return;
        }

        input.addEventListener('change', async (event) => {
            const files = Array.from(event.target.files);
            const compressedFiles = [];

            for (const file of files) {
                const compressed = await this.compress(file, quality);
                if (compressed) {
                    console.log("Compressed:", compressed.name, compressed.size);
                    compressedFiles.push(compressed);
                } else {
                    console.warn("Skipping file due to compression error:", file.name);
                }
            }

            if (compressedFiles.length > 0) {
                // Find the Livewire component
                const componentEl = input.closest('[wire\\:id]');
                if (!componentEl) {
                    console.error("No Livewire component found for this input.");
                    return;
                }

                const componentId = componentEl.getAttribute('wire:id');
                const component = window.Livewire.find(componentId);
                
                if (!component) {
                    console.error("Livewire component not found:", componentId);
                    return;
                }

                // Upload files to the component
                component.uploadMultiple(livewireProperty, compressedFiles,
                    () => {
                        console.log("✅ Upload success");
                        if (typeof onSuccess === 'function') onSuccess();
                        
                        // Show success toast if SweetAlert2 is available
                        if (window.Swal) {
                            Swal.fire({
                                toast: true,
                                position: 'top-end',
                                icon: 'success',
                                title: 'Images compressed and uploaded successfully',
                                showConfirmButton: false,
                                timer: 2000
                            });
                        }
                        
                        // Dispatch save event
                        window.Livewire.dispatch('save');
                    },
                    () => {
                        console.error("❌ Upload failed");
                        if (typeof onError === 'function') onError();
                    }
                );
            } else {
                console.error("❌ No files to upload after compression.");
                if (typeof onError === 'function') onError();
            }
        });
    }
};