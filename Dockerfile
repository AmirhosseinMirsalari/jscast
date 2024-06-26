# inherit from an existing image to add the functionality
FROM node:20-alpine3.18

# Set the working directory and assign ownership to the non-root user
WORKDIR /app

# Copy the package.json and package-lock.json files into the image.
COPY package*.json ./

# Define build arguments and use them
ARG NEXT_PUBLIC_GRAPHCMS_ENDPOINT
ARG GRAPHCMS_TOKEN

# Export build arguments as environment variables
ENV NEXT_PUBLIC_GRAPHCMS_ENDPOINT=$NEXT_PUBLIC_GRAPHCMS_ENDPOINT
ENV GRAPHCMS_TOKEN=$GRAPHCMS_TOKEN

# Install the dependencies.
RUN npm install

# Copy the rest of the source files into the image.
COPY . .

# Expose the port that the application listens on.
EXPOSE 3000

# Build the application.
RUN npm run build

# Run the application.
CMD ["npm", "start"]
