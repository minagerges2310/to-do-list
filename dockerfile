# Use a specific, lightweight Node.js version as the base image
FROM node:18-alpine


# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json for dependency caching
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Expose the port the application runs on
EXPOSE 3000

# Set a non-root user for better security
USER node

# Define the command to start the application
CMD ["node", "index.js"]